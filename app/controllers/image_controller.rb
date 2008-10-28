class ImageController < ApplicationController

  layout "ubcsurf_default_layout"

  before_filter :login_required

  active_scaffold :images do |config|
    config.create.columns = [:uploaded_data]
    config.update.columns = [:uploaded_data]
    
    config.create.multipart = true
    config.update.multipart = true
  end

end
