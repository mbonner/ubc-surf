class AddTripTitle < ActiveRecord::Migration
  def self.up
    add_column :trips, :title, :string
  end

  def self.down
    remove_column :trips, :title
  end
end
