class ChangeLessonAttributesAgain < ActiveRecord::Migration
  def change
    add_column :lessons, :overview, :text
  end
end
