class CreateActivityListItems < ActiveRecord::Migration
  def change
    create_table :activity_list_items do |t|
      t.string :list_item
      t.integer :activity_id

      t.timestamps
    end
  end
end
