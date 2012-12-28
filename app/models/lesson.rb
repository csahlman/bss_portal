# == Schema Information
#
# Table name: lessons
#
#  id                :integer          not null, primary key
#  summary           :string(255)
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  lesson_day_id     :integer
#  short_description :text
#  save_template     :boolean          default(FALSE)
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
  validates_presence_of :short_description
  validates_presence_of :days

  validates :tracks, presence: true  

  scope :saved, where(save_template: true)

  def self.parse_json(json_hash)
    return json_hash['new_lesson']['value']
  end

  def set_cloned_parameters(params_hash, clone)
    self.short_description = clone.short_description
    self.summary = clone.summary
    self.description = clone.description
    self.save_template = params_hash[:save_template]
    self.tracks = clone.tracks    
  end

  def set_parameters(params_hash)
    self.short_description = params_hash[:short_description]
    self.summary = params_hash[:summary]
    self.description = params_hash[:description]
    self.save_template = params_hash[:save_template]
  end

  def add_date(date)
    self.days << date
    save!
  end

end
