class AddSidebarLines < ActiveRecord::Migration
  def self.up
    add_column :trips, :sidebar_content, :string
    add_column :simple_stories, :sidebar_content, :string
    add_column :dynamic_stories, :sidebar_content, :string
  end

  def self.down
  end
end
