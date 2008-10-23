class Rentable < ActiveRecord::Base

  #has_many :images, :as => :owner
  has_one :image, :as => :owner

  validates_presence_of :title
  validates_presence_of :details
  validates_presence_of :comments
end
