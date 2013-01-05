class ChangeLessonAttributes < ActiveRecord::Migration
  def change
    remove_column :lessons, :save_template
    remove_column :lessons, :short_description
    remove_column :lessons, :description
    remove_column :lessons, :summary
    add_column :lessons, :start_time, :string
    add_column :lessons, :end_time, :string
    add_column :lessons, :title, :string
  end
end
