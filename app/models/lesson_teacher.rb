# == Schema Information
#
# Table name: lesson_teachers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  lesson_id  :integer
#  confirmed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LessonTeacher < ActiveRecord::Base
  # attr_accessible :confirmed, :lesson_id, :user_id
  # belongs_to :teacher, class_name: "User", foreign_key: "user_id"
  # belongs_to :confirmed_lesson, class_name: "Lesson", foreign_key: "lesson_id"
end
