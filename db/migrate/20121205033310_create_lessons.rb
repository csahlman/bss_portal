class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :day
      t.string :summary
      t.text :description
      t.text :learning_materials
      t.integer :track_id

      t.timestamps
    end
  end
end
