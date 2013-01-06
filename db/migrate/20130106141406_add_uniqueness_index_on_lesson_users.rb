class AddUniquenessIndexOnLessonUsers < ActiveRecord::Migration
  def change
    add_index :lesson_users, [:lesson_id, :user_id], unique: true
  end
end
