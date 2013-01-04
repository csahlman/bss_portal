class CreateLessonTemplateTracks < ActiveRecord::Migration
  def change
    create_table :lesson_template_tracks do |t|
      t.integer :lesson_template_id
      t.integer :track_id

      t.timestamps
    end
  end
end
