class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column "content_type", :string
      t.column "filename", :string     
      t.column "size", :integer
      
      # used with thumbnails, always required
      t.column "parent_id",  :integer 
      t.column "thumbnail", :string
      
      # required for images only
      t.column "width", :integer  
      t.column "height", :integer

      # required for db-based files only
      t.column "db_file_id", :integer

      # adding polymorphic keys, not sure what parent id is, but it says its used with thumbnails.
      t.column :owner_id, :integer
      t.column :owner_type, :string
    end

    # only for db-based files
    # create_table :db_files, :force => true do |t|
    #      t.column :data, :binary
    # end
  end

  def self.down
    drop_table :images
    
    # only for db-based files
    # drop_table :db_files
  end
end
