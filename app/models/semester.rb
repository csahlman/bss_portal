# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Semester < ActiveRecord::Base
  attr_accessible :location, :name

  has_many :days, dependent: :destroy
end
