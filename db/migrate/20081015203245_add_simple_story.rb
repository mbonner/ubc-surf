class AddSimpleStory < ActiveRecord::Migration
  def self.up
    create_table :simple_stories do |t|
      t.column :h2_content, :string
      t.column :p_content, :text
      t.column :expiration_date_time, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :simple_stories 
  end
end
