class SimpleStoryController < ApplicationController
  layout "ubcsurf_default_layout"

  before_filter :login_required

  active_scaffold :simple_stories do |config|
    config.list.columns = [:h2_content, :expiration_date_time]
    config.columns[:expiration_date_time].description = "After this date the story will be removed from the website home page."
    config.columns[:h2_content].description = "The story title, the html tag used is h2, hence the name"
    config.columns[:p_content].description = "The story/description, you can or <strong>should</strong> include html in this field."
    
    config.create.multipart = true
    config.update.multipart = true
  end
  
  def update
    params.each do |k,v|
      logger.debug("SimpleStoryController::before_update: #{k.to_s}, #{v.to_s} class: #{v.class}")
    end    
    params[:record].each do |k,v|
      logger.debug("\trecord params: #{k.to_s}, #{v.to_s} class: #{v.class}")
    end    
    super
  end
end
