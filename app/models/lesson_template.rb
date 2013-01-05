# == Schema Information
#
# Table name: lesson_templates
#
#  id         :integer          not null, primary key
#  start_time :string(255)
#  end_time   :string(255)
#  title      :string(255)
#  overview   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_value  :integer
#  default    :boolean
#

class LessonTemplate < ActiveRecord::Base

  has_many :attachments
  has_many :images

  has_many :objectives, dependent: :destroy

  has_many :periods, dependent: :destroy

  has_many :tracks, through: :lesson_template_tracks
  has_many :lesson_template_tracks, dependent: :destroy

  validates_presence_of :tracks, :overview, :day_value, :title, :start_time, :end_time

  VALID_TIMES = %w[BeforeHours 9:00AM 9:15AM 9:30AM 9:45AM 10:00AM 10:15AM 10:30AM 10:45AM 
    11:00AM 11:15AM 11:30AM 11:45AM 12:00PM 12:15PM 12:30PM 12:45PM 1:00PM 1:15PM
    1:30PM 1:45PM 2:00PM 2:15PM 2:30PM 2:45PM 3:00PM 3:15PM 3:30PM 3:45PM 4:00PM
    4:15PM 4:30PM 4:45PM 5:00PM 5:15PM 5:30PM 5:45PM 6:00PM 6:15PM 6:30PM 6:45PM
    7:00PM 7:15PM 7:30PM 7:45PM 8:00PM 8:15PM 8:30PM 8:45PM 9:00PM AfterHours]

  def set_attributes(params_hash)
    self.start_time = params_hash[:start_time]
    self.end_time = params_hash[:end_time]
    self.title = params_hash[:title]
    self.overview = params_hash[:overview]
    self.day_value = params_hash[:day_value]
    track_ids = params_hash[:track_ids].map { |id| id.to_i }
    track_ids.delete(0)
    self.tracks = Track.find(track_ids)
  end

  def create_lesson_clone
    
  end

end
