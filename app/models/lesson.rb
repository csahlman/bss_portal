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

  belongs_to :semester

  has_many :lesson_tracks, dependent: :destroy
  has_many :tracks, through: :lesson_tracks

  validates_presence_of :summary
  validates :day_value, presence: true, numericality: true
  validates :tracks, presence: true  


  def self.parse_json(json_hash)
    return json_hash['new_lesson']['value']
  end

end
