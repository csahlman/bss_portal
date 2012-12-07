class AddDayValueToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :day_value, :integer
  end
end
