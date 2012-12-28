class AddShortDescriptionToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :short_description, :text
  end
end
