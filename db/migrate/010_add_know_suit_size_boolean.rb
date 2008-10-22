class AddKnowSuitSizeBoolean < ActiveRecord::Migration
  def self.up
    add_column :trip_enrollments, :know_suit_size, :boolean
  end
  def self.down
    remove_column :trip_enrollments, :know_suit_size 
  end
end
