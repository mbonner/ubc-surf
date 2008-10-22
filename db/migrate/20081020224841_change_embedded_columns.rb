class ChangeEmbeddedColumns < ActiveRecord::Migration
  def self.up
    change_column :trips, :embedded_location, :text
    change_column :trips, :embedded_meeting, :text
  end

  def self.down
  end
end
