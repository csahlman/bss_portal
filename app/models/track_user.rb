# == Schema Information
#
# Table name: track_users
#
#  id         :integer          not null, primary key
#  track_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrackUser < ActiveRecord::Base
  attr_accessible :track_id, :user_id

  belongs_to :track 
  belongs_to :user
end
