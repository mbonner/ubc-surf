require "migration_helpers"
class AddFksToTripEnrollments < ActiveRecord::Migration
  extend MigrationHelpers
  def self.up
    add_column :trip_enrollments, :trip_id, :integer
    add_column :trip_enrollments, :payment_id, :integer
    foreign_key(:trip_enrollments, :trip_id, :trips)
    foreign_key(:trip_enrollments, :payment_id, :payments)
  end

  def self.down
  end
end
