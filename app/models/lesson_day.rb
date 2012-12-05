# == Schema Information
#
# Table name: lesson_days
#
#  id          :integer          not null, primary key
#  day_value   :integer
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LessonDay < ActiveRecord::Base
  attr_accessible :day_value
  has_many :lessons, dependent: :destroy
  belongs_to :semester
end
