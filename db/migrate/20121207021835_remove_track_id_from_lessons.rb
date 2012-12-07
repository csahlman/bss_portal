class RemoveTrackIdFromLessons < ActiveRecord::Migration
  def up
    remove_column :lessons, :track_id
  end

  def down
    add_column :lessons, :track_id, :string
  end
end
