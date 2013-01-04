class AddPermissionsToUsers < ActiveRecord::Migration
  def change
    add_column :semesters, :end_date, :datetime
    add_column :semesters, :start_date, :datetime
  end
end
