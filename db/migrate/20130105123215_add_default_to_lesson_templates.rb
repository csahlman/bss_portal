class AddDefaultToLessonTemplates < ActiveRecord::Migration
  def change
    add_column :lesson_templates, :default, :boolean
  end
end
