class AddLessonDayIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_day_id, :integer
    remove_column :lessons, :day
  end
end
