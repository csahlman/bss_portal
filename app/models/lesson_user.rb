# == Schema Information
#
# Table name: lesson_users
#
#  id                     :integer          not null, primary key
#  lesson_id              :integer
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  assigned               :boolean          default(FALSE)
#  confirmed              :boolean          default(FALSE)
#  assigned_at_expiration :datetime
#

class LessonUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson

end
