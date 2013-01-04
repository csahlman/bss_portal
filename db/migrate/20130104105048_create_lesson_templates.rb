class CreateLessonTemplates < ActiveRecord::Migration
  def change
    create_table :lesson_templates do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :overview

      t.timestamps
    end
  end
end
