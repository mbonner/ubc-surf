class Image < ActiveRecord::Base
  acts_as_attachment :storage => :file_system, :max_size => 300.kilobytes, :content_type => :image
  belongs_to :owner, :polymorphic => true

  validates_as_attachment
  
  def to_label
    self.public_filename
  end
end
