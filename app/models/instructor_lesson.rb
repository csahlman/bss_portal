class InstructorLesson < ActiveRecord::Base
  attr_accessible :instructor_id, :lesson_id
  belongs_to :lesson
  belongs_to :instructor
end
