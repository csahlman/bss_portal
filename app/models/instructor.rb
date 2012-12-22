class Instructor < ActiveRecord::Base
  has_many :lessons, through: :instructor_lessons
  has_many :instructor_lessons, dependent: :destroy
end
