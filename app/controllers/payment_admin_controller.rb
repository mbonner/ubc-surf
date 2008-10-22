class PaymentAdminController < ApplicationController

  layout "ubcsurf_default_layout"

  before_filter :login_required

  active_scaffold :payments do |config|
  end  
end
