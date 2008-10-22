class AddColumnsToTrips < ActiveRecord::Migration
  def self.up
  add_column :trips, :camping, :boolean
  add_column :trips, :embedded_location, :string
  add_column :trips, :embedded_meeting, :string
  end

  def self.down
  end
end
