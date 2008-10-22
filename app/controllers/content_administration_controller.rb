class ContentAdministrationController < ApplicationController
  layout "ubcsurf_default_layout"

  before_filter :login_required

  def index
  end
end
