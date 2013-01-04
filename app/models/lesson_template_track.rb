# == Schema Information
#
# Table name: lesson_template_tracks
#
#  id                 :integer          not null, primary key
#  lesson_template_id :integer
#  track_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class LessonTemplateTrack < ActiveRecord::Base
  belongs_to :lesson_template
  belongs_to :track
end
