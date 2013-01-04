# == Schema Information
#
# Table name: lesson_templates
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  title      :string(255)
#  overview   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LessonTemplate < ActiveRecord::Base

  has_many :attachments
  has_many :images

  has_many :objectives, dependent: :destroy

  has_many :periods, dependent: :destroy

  has_many :tracks, through: :lesson_template_tracks
  has_many :lesson_template_tracks, dependent: :destroy

  validates_presence_of :tracks, :periods, :objectives

end
