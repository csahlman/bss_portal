class CreateLessonTracks < ActiveRecord::Migration
  def change
    create_table :lesson_tracks do |t|
      t.integer :lesson_id
      t.integer :track_id

      t.timestamps
    end
  end
end
