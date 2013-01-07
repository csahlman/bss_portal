# == Schema Information
#
# Table name: periods
#
#  id                 :integer          not null, primary key
#  start_time         :string(255)
#  end_time           :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lesson_id          :integer
#  lesson_template_id :integer
#  position           :integer
#

class Period < ActiveRecord::Base

  has_many :activities, order: 'position', dependent: :destroy

  belongs_to :lesson
  belongs_to :lesson_template  

  acts_as_list :scope => :lesson_template

  VALID_TIMES = %w[BeforeHours 9:00AM 9:15AM 9:30AM 9:45AM 10:00AM 10:15AM 10:30AM 10:45AM 
    11:00AM 11:15AM 11:30AM 11:45AM 12:00PM 12:15PM 12:30PM 12:45PM 1:00PM 1:15PM
    1:30PM 1:45PM 2:00PM 2:15PM 2:30PM 2:45PM 3:00PM 3:15PM 3:30PM 3:45PM 4:00PM
    4:15PM 4:30PM 4:45PM 5:00PM 5:15PM 5:30PM 5:45PM 6:00PM 6:15PM 6:30PM 6:45PM
    7:00PM 7:15PM 7:30PM 7:45PM 8:00PM 8:15PM 8:30PM 8:45PM 9:00PM AfterHours]

  def to_s
    "#{start_time} - #{end_time}"      
  end  
end
