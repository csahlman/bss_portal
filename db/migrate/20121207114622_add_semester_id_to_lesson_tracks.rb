class AddSemesterIdToLessonTracks < ActiveRecord::Migration
  def change
    add_column :lesson_tracks, :semester_id, :integer
  end
end
