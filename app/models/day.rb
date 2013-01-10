# == Schema Information
#
# Table name: days
#
#  id          :integer          not null, primary key
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  day_value   :integer
#  semester_id :integer
#

class Day < ActiveRecord::Base
  belongs_to :semester

  has_many :lessons, through: :day_lessons, dependent: :destroy
  has_many :day_lessons, dependent: :destroy

  validates_presence_of :date
  validates_presence_of :day_value


  default_scope order('day_value ASC')


  def to_s
    "#{day_value} | #{date.strftime("%Y-%m-%d")}"
  end

  def populate_lessons(lesson_templates)
    lesson_templates.each do |template|
      unless self.lessons.map(&:lesson_template_id).include?(template.id)
        lesson = Lesson.create_clone(template)
        self.lessons << lesson
      end
    end
    save!
  end

end
