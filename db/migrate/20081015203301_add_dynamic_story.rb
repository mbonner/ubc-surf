class AddDynamicStory < ActiveRecord::Migration
  def self.up
    create_table :dynamic_stories do |t|
      t.column :css_id, :string
      t.column :summary_p_content, :text
      t.column :p_content, :text
      t.column :expiration_date_time, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :dynamic_stories 
  end
end
