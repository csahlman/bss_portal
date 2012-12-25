class AddNameAndCompanyAndGuestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :guest, :boolean, default: false
    add_column :users, :remember_token, :string
  end
end
