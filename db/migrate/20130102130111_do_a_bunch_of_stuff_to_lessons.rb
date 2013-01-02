class DoABunchOfStuffToLessons < ActiveRecord::Migration
  def change
    add_column :lesson_users, :confirmed, :boolean, default: false
    add_column :lessons, :assigned, :boolean, default: false
  end
end
