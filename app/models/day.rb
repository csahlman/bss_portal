# == Schema Information
#
# Table name: days
#
#  id          :integer          not null, primary key
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  day_value   :integer
#  semester_id :integer
#  class_day   :datetime
#

class Day < ActiveRecord::Base
  belongs_to :semester

  has_many :lessons, through: :day_lessons
  has_many :day_lessons, dependent: :destroy

  default_scope order('date ASC')
  
end
