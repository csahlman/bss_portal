class CreateInstructorLessons < ActiveRecord::Migration
  def change
    create_table :instructor_lessons do |t|
      t.integer :lesson_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end
