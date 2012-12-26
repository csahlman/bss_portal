class CreateLessonUsers < ActiveRecord::Migration
  def change
    create_table :lesson_users do |t|
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
  end
end
