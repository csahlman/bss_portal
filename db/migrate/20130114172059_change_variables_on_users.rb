class ChangeVariablesOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :linked_in, :string, default: nil
    change_column :users, :twitter, :string, default: nil
    remove_column :users, :facebook
    add_column :users, :description, :text
  end
end
