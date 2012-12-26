class ChangeDayLayOut < ActiveRecord::Migration
  def change
    add_column :days, :day_value, :integer
    add_column :days, :semester_id, :integer
    add_column :days, :class_day, :datetime
    remove_column :days, :lesson_id
    drop_table :admins
    drop_table :instructor_lessons
    drop_table :instructors
  end
end
