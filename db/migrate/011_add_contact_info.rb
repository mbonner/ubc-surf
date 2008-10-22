class AddContactInfo < ActiveRecord::Migration
  def self.up
    add_column :trip_enrollments, :phone, :string
    add_column :trip_enrollments, :email_address, :string
  end

  def self.down
    remove_column :trip_enrollments, :phone
    remove_column :trip_enrollments, :email_address
  end
end
