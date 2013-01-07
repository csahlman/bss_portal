class AddPositionsToModels < ActiveRecord::Migration
  def change
    add_column :periods, :position, :integer
    add_column :objectives, :position, :integer
    add_column :activities, :position, :integer
  end
end
