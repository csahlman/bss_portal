class AddAssignedToLessons < ActiveRecord::Migration
  def change
    add_column :lesson_users, :assigned, :boolean, default: false
  end
end
