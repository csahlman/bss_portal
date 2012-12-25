class AddRequestRecoverAndTimeCreatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :request_recover, :boolean, default: false
    add_column :users, :expiration_time, :datetime
  end
end
