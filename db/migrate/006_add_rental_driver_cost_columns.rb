class AddRentalDriverCostColumns < ActiveRecord::Migration
  def self.up
    add_column :trips, :board_rental_cost, :float, :default => 0.0
    add_column :trips, :booty_rental_cost, :float, :default => 0.0
    add_column :trips, :glove_rental_cost, :float, :default => 0.0
    add_column :trips, :suit_rental_cost, :float, :default => 0.0
    add_column :trips, :total_rental_cost, :float, :default => 0.0
    add_column :trips, :driver_discount, :float, :default => 0.0
  end

  def self.down
  end
end
