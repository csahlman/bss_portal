# == Schema Information
#
# Table name: lesson_tracks
#
#  id          :integer          not null, primary key
#  lesson_id   :integer
#  track_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  day_value   :integer
#  semester_id :integer
#

class LessonTrack < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :track
  belongs_to :semester

  def to_label
    day_value.to_s
  end
end
