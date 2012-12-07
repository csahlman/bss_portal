class AddSemesterIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :semester_id, :integer
    remove_column :lesson_tracks, :semester_id
    remove_column :lesson_tracks, :day_value
  end
end
