# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Instructor < ActiveRecord::Base
  has_many :lessons, through: :instructor_lessons
  has_many :instructor_lessons, dependent: :destroy
end
