class DynamicStoryController < ApplicationController

  layout "ubcsurf_default_layout"

  before_filter :login_required

  active_scaffold :dynamic_stories do |config|
    config.create.columns = [:css_id, :expiration_date_time, :summary_p_content, :p_content, :image, :sidebar_content]
    config.update.columns = [:css_id, :expiration_date_time, :summary_p_content, :p_content, :image, :sidebar_content]
    config.list.columns = [:css_id, :expiration_date_time, :summary_p_content]
    config.columns[:css_id].description = "The story title, the html tag used is h2, hence the name, the title is a link for dynamic stories"
    config.columns[:css_id].label = "H2 Link Title"
    config.columns[:expiration_date_time].description = "After this date the story will be removed from the website home page."    
    # config.columns[:css_id].description = "This is a simple string, for example \"oct_trip_to_tofino\", used to label the html elements used to generate the story.  This <strong>WILL NOT</strong> appear anywhere in the site visiable to the end user."
    config.columns[:summary_p_content].description = "The short description or summary, this is shown all the time."
    config.columns[:p_content].description = "The complete/long story or description, you can or <strong>should</strong> include html in this field.  This is shown or hidden when the user clicks on the link."
  end
end
