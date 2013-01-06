class AddAssignedAtToLessonUsers < ActiveRecord::Migration
  def change
    add_column :lesson_users, :assigned_at_expiration, :datetime
  end
end
