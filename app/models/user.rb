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
#  guest                  :boolean          default(FALSE)
#  remember_token         :string(255)
#  password_digest        :string(255)
#  request_recover        :boolean          default(FALSE)
#  expiration_time        :datetime
#

class User < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true, format: { with: email_regex },
    uniqueness: { case_sensitive: false }

  scope :inactive, -> { where("expiration_time <= :now", now: Time.zone.now) } 
  scope :requested_recover, where(request_recover: true).order('name ASC')
  
  before_create :create_remember_token

  has_secure_password

  def set_user_attributes(user_hash)
    self.email = user_hash[:email]
    self.name = user_hash[:name]
    self.company = user_hash[:company] 
  end

  def set_expiration_time
    self.expiration_time = 1.week.from_now 
  end

  def set_random_password
    random_password = (0...8).map{65.+(rand(26)).chr}.join
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
