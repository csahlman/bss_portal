# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer
#

class Day < ActiveRecord::Base
  belongs_to :lesson
end
