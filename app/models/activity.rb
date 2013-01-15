# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  activity   :text
#  period_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#  parent_id  :integer
#

class Activity < ActiveRecord::Base
  has_many :activity_list_items, dependent: :destroy

  belongs_to :period


  acts_as_list :scope => :period
  
end
