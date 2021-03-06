# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  name                   :string(255)
#  company                :string(255)
#  remember_token         :string(255)
#  password_digest        :string(255)
#  request_recover        :boolean          default(FALSE)
#  expiration_time        :datetime
#  linked_in              :string(255)
#  twitter                :string(255)
#  description            :text
#

class User < ActiveRecord::Base
  attr_accessor :picture_url

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true, format: { with: email_regex },
    uniqueness: { case_sensitive: false }

  validates_presence_of :tracks

  has_many :lessons, through: :lesson_users
  has_many :lesson_users, dependent: :destroy

  has_many :tracks, through: :track_users
  has_many :track_users, dependent: :destroy

  has_one :image, dependent: :destroy

  # has_many :confirmed_lessons, class_name: "Lesson", 
  #   through: :lesson_teachers
  # has_many :lesson_teachers, dependent: :destroy

  scope :inactive, -> { where("expiration_time <= :now", now: Time.zone.now) } 
  scope :requested_recover, where(request_recover: true).order('name ASC')

  scope :ordered_by_name, order('name ASC')
  
  before_create :create_remember_token

  has_secure_password

  def to_s
    "#{name} #{email}"
  end

  def self.email_search(search)
    where('email LIKE ?', "%#{search}%").order(:name)
  end

  def self.name_search(search)
    where('name LIKE ?', "%#{search}%").order(:name)
  end

  def interested_in_teaching
    teaching_lessons = []
    lesson_users.where(assigned: false).each do |lesson_user|
      teaching_lessons << lesson_user.lesson
    end
    teaching_lessons
  end
  
  def assigned_to_teach?(lesson)
    lesson_users.where('lesson_id = ? AND assigned = ?', lesson.id, true).any?
  end

  def assigned_to_teach
    lesson_users.where(assigned: true).where(confirmed: false)
  end

  def confirmed_teacher?
    lesson_users.where(confirmed: true).any?
  end

  def teaching_ids
    lesson_users.where(confirmed: true).map(&:lesson_id).uniq
  end

  def teaching
    lesson_users.where(confirmed: true)
  end

  def teaching?(lesson_id)
    self.teaching_ids.include?(lesson_id)
  end

  def set_user_attributes(user_hash)
    self.email = user_hash[:email] if user_hash[:email].present?
    self.name = user_hash[:name] if user_hash[:name].present?
    self.company = user_hash[:company] if user_hash[:company].present?
    self.linked_in = user_hash[:linked_in] if user_hash[:linked_in].present?
    self.twitter = user_hash[:twitter] if user_hash[:twitter].present?
    self.description = user_hash[:description] if user_hash[:description].present?
    track_ids = user_hash[:track_ids].map { |id| id.to_i }
    track_ids.delete(0)
    self.tracks = Track.find(track_ids)
    if user_hash[:image].present?
      self.build_image(picture: user_hash[:image])
    elsif user_hash[:picture_url].present?
      self.build_image(picture_url: user_hash[:picture_url])
    end
  end

  def set_expiration_time
    self.expiration_time = 1.week.from_now 
  end

  def set_random_password
    random_password = (0...10).map{65.+(rand(26)).chr}.join
    self.password = random_password
    self.password_confirmation = random_password
    random_password
  end

  def active?
    admin || (self.expiration_time > Time.zone.now)
  end

  def activate
    self.request_recover = false
    self.expiration_time = 1.week.from_now
    save!
  end

  private
    
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end
