class LessonDay < ActiveRecord::Base
  attr_accessible :day_value
  has_many :lessons, dependent: :destroy
  belongs_to :semester
end
