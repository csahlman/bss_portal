class Semester < ActiveRecord::Base
  attr_accessible :location, :name
  has_many :lesson_days, dependent: :destroy
end
