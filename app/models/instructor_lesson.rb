# == Schema Information
#
# Table name: instructor_lessons
#
#  id            :integer          not null, primary key
#  lesson_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InstructorLesson < ActiveRecord::Base
  attr_accessible :instructor_id, :lesson_id
  belongs_to :lesson
  belongs_to :instructor
end
