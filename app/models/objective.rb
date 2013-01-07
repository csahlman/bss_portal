# == Schema Information
#
# Table name: objectives
#
#  id                 :integer          not null, primary key
#  objective          :string(255)
#  lesson_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lesson_template_id :integer
#  position           :integer
#

class Objective < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :lesson_template

  acts_as_list :scope => :lesson_template

end
