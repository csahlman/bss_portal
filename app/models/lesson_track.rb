# == Schema Information
#
# Table name: lesson_tracks
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LessonTrack < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :track

  amoeba do 
    enable
  end


  def to_label
    day_value.to_s
  end
end
