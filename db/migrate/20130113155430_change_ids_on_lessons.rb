class ChangeIdsOnLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :day_id, :integer
  end
end
