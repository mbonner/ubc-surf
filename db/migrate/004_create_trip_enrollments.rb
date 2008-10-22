class CreateTripEnrollments < ActiveRecord::Migration
  def self.up
    create_table :trip_enrollments do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :rent, :boolean, :default => false
      t.column :board_type, :string
      t.column :suit, :boolean, :default => false
      t.column :suit_size, :string
      t.column :height, :string
      t.column :weight, :string
      t.column :gloves, :boolean, :default => false
      t.column :glove_size, :string
      t.column :hoody, :boolean, :default => false
      t.column :hoody_size, :boolean
      t.column :booties, :boolean, :default => false
      t.column :booty_size, :string
      t.column :shoe_size_type, :string
      t.column :driver, :boolean, :default => false
      t.column :car_capacity, :integer
      t.column :tent, :boolean, :default => false
      t.column :tent_capacity, :integer
      t.column :tarp, :boolean, :default => false
      t.column :stove, :boolean, :default => false
      t.column :notes, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :trip_enrollments
  end
end
