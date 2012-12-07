# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :lessons, through: :lesson_tracks
  has_many :lesson_tracks

  def ordered_days
    lessons.order('day_value ASC')
  end

  def to_label  #for simple_form association
    name
  end
end
