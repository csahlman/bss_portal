class AddFinalToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :final, :boolean
  end
end
