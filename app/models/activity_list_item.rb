# == Schema Information
#
# Table name: activity_list_items
#
#  id          :integer          not null, primary key
#  list_item   :string(255)
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ActivityListItem < ActiveRecord::Base
  belongs_to :activity
end
