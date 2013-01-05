class AddPublicToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :public, :boolean
  end
end
