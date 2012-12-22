class AddLessonIdToDays < ActiveRecord::Migration
  def change
    add_column :days, :lesson_id, :integer
  end
end
