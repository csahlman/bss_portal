# == Schema Information
#
# Table name: lessons
#
#  id                 :integer          not null, primary key
#  summary            :string(255)
#  description        :text
#  learning_materials :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lesson_day_id      :integer
#  day_value          :integer
#  semester_id        :integer
#

class Lesson < ActiveRecord::Base
  attr_accessible  :description, :learning_materials, :summary

  has_many :lesson_tracks, dependent: :destroy
  has_many :tracks, through: :lesson_tracks

  has_many :days, through: :day_lessons
  has_many :day_lessons, dependent: :destroy

  has_many :users, through: :lesson_users
  has_many :lesson_users, dependent: :destroy

  # has_many :photos or something

  # has_many :learning_materials

  validates_presence_of :summary

  validates :tracks, presence: true  


  def self.parse_json(json_hash)
    return json_hash['new_lesson']['value']
  end

  def set_parameters(params_hash)
    self.summary = params_hash[:summary]
    self.day_value = params_hash[:day_value]
    self.description = params_hash[:description]
    self.lesson_day_id = params_hash[:lesson_day_id] 
  end

  def add_date(date)
    self.days << date
    save!
  end

end
