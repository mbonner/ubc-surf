class Image < ActiveRecord::Base
  
  has_attachment :storage => :file_system, :path_prefix => 'public/images', :resize_to => '350x', :content_type => :image, :thumbnails => { :thumb => [50, 50], :geometry => 'x50' } 
  validates_as_attachment

  belongs_to :owner, :polymorphic => true
  
  def to_label
    self.public_filename
  end
end
