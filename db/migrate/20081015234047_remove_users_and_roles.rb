class RemoveUsersAndRoles < ActiveRecord::Migration
  def self.up
    drop_table :users
    drop_table :roles
  end

  def self.down
  end
end
