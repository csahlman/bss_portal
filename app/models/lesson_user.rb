# == Schema Information
#
# Table name: lesson_users
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  assigned   :boolean          default(FALSE)
#

class LessonUser < ActiveRecord::Base
  attr_accessible :lesson_id, :user_id
  belongs_to :user
  belongs_to :lesson
end
