class AddDayValueToLessonTemplates < ActiveRecord::Migration
  def change
    add_column :lesson_templates, :day_value, :integer
  end
end
