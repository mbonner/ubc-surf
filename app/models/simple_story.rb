class SimpleStory < ActiveRecord::Base

  has_one :image, :as => :owner

  validates_presence_of :expiration_date_time
  validates_presence_of :h2_content
  validates_presence_of :p_content
  
  # def to_label
  # end
  def sort_date
    return self.expiration_date_time
  end  
end
