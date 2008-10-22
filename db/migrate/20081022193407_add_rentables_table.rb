class AddRentablesTable < ActiveRecord::Migration
  def self.up
    create_table :rentables do |t|
      t.column :title, :string
      t.column :details, :text
      t.column :comments, :text
      t.column :available, :boolean
      t.column :out_date_time, :datetime
      t.column :in_date_time, :datetime 
      t.timestamps
    end
  end

  def self.down
  end
end
