class AddSaveTemplateToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :save_template, :boolean, default: false
    remove_column :days, :class_day
    remove_column :lessons, :semester_id
    remove_column :lessons, :day_value
    remove_column :lessons, :learning_materials
  end
end
