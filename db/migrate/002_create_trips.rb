class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.column :cost, :float
      t.column :start, :datetime
      t.column :end, :datetime
      t.column :description, :string
      t.column :meeting_location, :string
      t.column :meeting_location_link, :string
      t.column :location, :string
      t.column :location_link, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
