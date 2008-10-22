class DynamicStory < ActiveRecord::Base

  has_one :image, :as => :owner

  validates_presence_of :css_id
  validates_format_of :css_id, :with => /(\s[a-zA-Z0-9])+/, 
   :message => 'The css id field can only contain letters, spaces, and numbers'
  # need a length requirement,  
  validates_presence_of :summary_p_content
  validates_presence_of :p_content
  validates_presence_of :expiration_date_time
  
  # def validate
  #   # if css_id 
  #   #   self.css_id.downcase!
  #   #   self.css_id.gsub!(" ", "_")
  #   #   # replace all punct.
  #   # end
  # end
  
  def generate_title
    title = self.css_id.downcase
    title.gsub!(" ", "_")
    return title
  end
  
  def sort_date
    return self.expiration_date_time
  end
end
