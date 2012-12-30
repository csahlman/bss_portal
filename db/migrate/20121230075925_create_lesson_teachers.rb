class CreateLessonTeachers < ActiveRecord::Migration
  def change
    create_table :lesson_teachers do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
