class AddLessonIdsToImages < ActiveRecord::Migration
  def change
    add_column :images, :lesson_id, :integer
    add_column :attachments, :lesson_id, :integer
  end
end
