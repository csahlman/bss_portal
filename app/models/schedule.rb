# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  day        :integer
#  title      :string(255)
#  semester   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ActiveRecord::Base
  attr_accessible :day, :title

  belongs_to :semester
end