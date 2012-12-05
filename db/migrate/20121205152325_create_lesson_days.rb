class CreateLessonDays < ActiveRecord::Migration
  def change
    create_table :lesson_days do |t|
      t.integer :day_value
      t.integer :semester_id

      t.timestamps
    end
  end
end
