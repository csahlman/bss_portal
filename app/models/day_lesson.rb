# == Schema Information
#
# Table name: day_lessons
#
#  id         :integer          not null, primary key
#  day_id     :integer
#  lesson_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DayLesson < ActiveRecord::Base
  attr_accessible :day_id, :lesson_id

  belongs_to :day
  belongs_to :lesson

  amoeba do 
    enable
  end
end
