class AddDayToLessonTracks < ActiveRecord::Migration
  def change
    add_column :lesson_tracks, :day_value, :integer
    add_index :lesson_tracks, :day_value
  end
end
