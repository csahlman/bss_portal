# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  end_date   :datetime
#  start_date :datetime
#  public     :boolean
#

class Semester < ActiveRecord::Base
  attr_accessible :location, :name, :start_date, :end_date, :public

  has_many :days, dependent: :destroy

  def populate_lessons
    
  end

  def to_s
    "#{self.name} #{self.location}"
  end
end
