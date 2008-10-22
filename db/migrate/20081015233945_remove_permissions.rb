class RemovePermissions < ActiveRecord::Migration
  def self.up
    drop_table :permissions
  end

  def self.down
  end
end
