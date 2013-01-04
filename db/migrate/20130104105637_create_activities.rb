class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :activity
      t.integer :period_id

      t.timestamps
    end
  end
end
