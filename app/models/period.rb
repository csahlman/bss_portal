# == Schema Information
#
# Table name: periods
#
#  id                 :integer          not null, primary key
#  start_time         :datetime
#  end_time           :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lesson_id          :integer
#  lesson_template_id :integer
#

class Period < ActiveRecord::Base
  has_many :activities
  belongs_to :lesson
  belongs_to :lesson_template
end
