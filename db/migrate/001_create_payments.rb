class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      # do I just want to store all this info in here?
      # users email, where the payment came from, what other info will i get form paypal in the reply?
      t.column :amount, :float
      t.column :email, :string
      t.column :name, :string
      t.column :confirmation, :integer 
      t.column :payment_method, :string
      t.column :description, :string
      t.column :status, :string
      t.column :test, :string
      t.column :received, :boolean
      #:datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
