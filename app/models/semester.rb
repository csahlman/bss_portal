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
#  city       :string(255)
#

class Semester < ActiveRecord::Base
  attr_accessible :location, :name, :city, :start_date, :end_date, :public

  has_many :days, dependent: :destroy

  scope :public, where(public: true)
  scope :old, -> { where("end_date <= :now", now: Time.zone.now) }
  scope :current, -> { where("end_date >= :now", now: Time.zone.now )}

  validates_presence_of :location, :name, :city, :start_date, :end_date

  def to_s
    "#{self.name} #{self.location}"
  end

  def populate_all
    self.days.each do |day|
      day.populate_lessons(LessonTemplate.default.where(day_value: day.day_value))
    end
  end

end
