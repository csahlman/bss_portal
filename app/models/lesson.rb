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
  attr_accessible :day, :description, :learning_materials, :summary

  belongs_to :track
  belongs_to :lesson_day
end
