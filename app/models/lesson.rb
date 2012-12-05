# == Schema Information
#
# Table name: lessons
#
#  id                 :integer          not null, primary key
#  summary            :string(255)
#  description        :text
#  learning_materials :text
#  track_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lesson_day_id      :integer
#

class Lesson < ActiveRecord::Base
  attr_accessible  :description, :learning_materials, :summary

  validates_presence_of :summary
  
  belongs_to :track
  belongs_to :lesson_day

  def self.parse_json(json_hash)
    return json_hash['new_lesson']['value']
  end

end
