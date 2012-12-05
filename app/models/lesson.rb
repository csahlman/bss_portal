# == Schema Information
#
# Table name: lessons
#
#  id                 :integer          not null, primary key
#  day                :integer
#  summary            :string(255)
#  description        :text
#  learning_materials :text
#  track_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Lesson < ActiveRecord::Base
  attr_accessible :day, :description, :learning_materials, :summary, :track_id
end
