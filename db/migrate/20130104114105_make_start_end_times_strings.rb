class MakeStartEndTimesStrings < ActiveRecord::Migration
  def change
    change_column :lesson_templates, :start_time, :string
    change_column :lesson_templates, :end_time, :string
    change_column :periods, :end_time, :string
    change_column :periods, :start_time, :string
  end
end
