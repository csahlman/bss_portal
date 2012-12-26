class CreateDayLessons < ActiveRecord::Migration
  def change
    create_table :day_lessons do |t|
      t.integer :day_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
