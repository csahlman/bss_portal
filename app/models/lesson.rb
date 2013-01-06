# == Schema Information
#
# Table name: lessons
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  assigned           :boolean          default(FALSE)
#  start_time         :string(255)
#  end_time           :string(255)
#  title              :string(255)
#  overview           :text
#  lesson_template_id :integer
#

class Lesson < ActiveRecord::Base

  has_many :attachments
  has_many :images

  has_many :lesson_tracks, dependent: :destroy
  has_many :tracks, through: :lesson_tracks

  has_many :days, through: :day_lessons
  has_many :day_lessons, dependent: :destroy

  has_many :users, through: :lesson_users
  has_many :lesson_users, dependent: :destroy

  has_many :periods, dependent: :destroy

  has_many :objectives, dependent: :destroy

  belongs_to :lesson_template

  # has_many :teachers, class_name: "User", 
  #   through: :lesson_teachers
  # has_many :lesson_teachers, dependent: :destroy

  # has_many :photos or something

  # has_many :learning_materials

  validates_presence_of :tracks

  # scope :saved, where(save_template: true)

  VALID_TIMES = %w[BeforeHours 9:00AM 9:15AM 9:30AM 9:45AM 10:00AM 10:15AM 10:30AM 10:45AM 
    11:00AM 11:15AM 11:30AM 11:45AM 12:00PM 12:15PM 12:30PM 12:45PM 1:00PM 1:15PM
    1:30PM 1:45PM 2:00PM 2:15PM 2:30PM 2:45PM 3:00PM 3:15PM 3:30PM 3:45PM 4:00PM
    4:15PM 4:30PM 4:45PM 5:00PM 5:15PM 5:30PM 5:45PM 6:00PM 6:15PM 6:30PM 6:45PM
    7:00PM 7:15PM 7:30PM 7:45PM 8:00PM 8:15PM 8:30PM 8:45PM 9:00PM AfterHours]

  def self.create_clone(template)
    new_lesson = Lesson.new do |lesson|
      lesson.start_time = template.start_time
      lesson.end_time = template.end_time
      lesson.title = template.title
      lesson.overview = template.overview
      lesson.lesson_template_id = template.id
      lesson.tracks = template.tracks
      lesson.objectives = template.objectives
      lesson.periods = template.periods
      lesson.attachments = template.attachments
      lesson.images = template.images
      # self.objectives = template.objectives
      # self.periods = template.periods
    end  
    new_lesson.save!
    new_lesson
  end

  def add_instructor(user)
    lesson_users.each do |lesson_user|
      if lesson_user.assigned? && lesson_user.user_id != user.id
        lesson_user.update_attribute(:assigned, false)
      elsif lesson_user.user_id == user.id
        lesson_user.update_attribute(:assigned, true)
      end
    end
  end

  def multiple_teachers?
    lesson_users.where('lesson_id = ? AND assigned = ?', self.id, true).length > 1
  end

  def remove_instructor(user)
    lesson_users.where(assigned: true).last.update_attribute(:assigned, false)
  end

  def assigned?
    lesson_users.where(assigned: true).any? ? true : false
  end

  def dates_by_semester(semester)
    dates = self.days.where(semester_id: semester.id)
    if dates.length > 1
      "#{dates.first.date.strftime('%Y-%m-%d')}-#{dates.last.date.strftime('%Y-%m-%d')}"
    else
      "#{dates.first.date.strftime('%Y-%m-%d')}"
    end
  end

  def self.parse_json(json_hash)
    return json_hash['new_lesson']['value']
  end

  def set_cloned_parameters(params_hash, clone)
    self.short_description = clone.short_description
    self.title = clone.title
    self.description = clone.description
    self.save_template = params_hash[:save_template]
    self.tracks = clone.tracks
    self.images = clone.images    
  end

  def set_parameters(params_hash)
    self.short_description = params_hash[:short_description]
    self.title = params_hash[:summary]
    self.description = params_hash[:description]
    self.save_template = params_hash[:save_template]
    if params_hash[:image_ids]
      image = self.images.new
      image.picture = params_hash[:image_ids]
      self.images << image
    end
    if params_hash[:attachment_ids]
      attachment = self.attachments.new
      attachment.document = params_hash[:attachment_ids]
      self.attachments << attachment
    end
  end

  def add_user(user)
    unless self.users.include?(user)
      self.users << user
      save!
    end
  end

  def remove_user(user)
    self.users.delete(user)
    save!
  end

end
