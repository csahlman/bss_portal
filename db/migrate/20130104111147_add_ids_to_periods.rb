class AddIdsToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :lesson_id, :integer
    add_column :periods, :lesson_template_id, :integer
    add_column :images, :lesson_template_id, :integer
    add_column :attachments, :lesson_template_id, :integer
  end
end
