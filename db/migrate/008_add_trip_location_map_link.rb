class AddTripLocationMapLink < ActiveRecord::Migration
  def self.up
    add_column :trips, :trip_meeting_location_map_link, :string
  end

  def self.down
    remove_column :trips, :trip_meeting_location_map_link
  end
end
