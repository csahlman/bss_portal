class ChangeKeysOnLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :lesson_day_id
    add_column :lessons, :lesson_template_id, :integer
  end
end
