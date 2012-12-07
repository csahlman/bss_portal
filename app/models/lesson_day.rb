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

  def to_label
    day_value.to_s
  end
end
