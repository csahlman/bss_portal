class AddSocialNetworkingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linked_in, :string, default: nil
    add_column :users, :facebook, :string, default: nil
    add_column :users, :twitter, :string, default: nil
    remove_column :users, :guest
  end
end
