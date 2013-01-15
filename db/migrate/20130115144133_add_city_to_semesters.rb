class AddCityToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :city, :string
    change_column :lesson_templates, :default, :boolean, default: true
  end
end
