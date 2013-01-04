class AddLessonTemplateIdToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :lesson_template_id, :integer
  end
end
