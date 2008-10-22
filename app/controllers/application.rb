# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  include RoleRequirementSystem
  #include ExceptionLoggable look at http://snippets.aktagon.com/snippets/78-How-to-install-the-exception-logger-Rails-plugin-and-protect-the-logs-with-basic-authentication

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a2e4b2b34ae9967528ac3449de8736b9'
  
  before_filter :index_init

  protected
  
  def self.active_scaffold_controller_for(klass)
    return TripEnrollmentAdminController if klass == TripEnrollment
    return PaymentAdminController if klass == Payment
    return TripAdminController if klass == Trip
    return "#{klass}ScaffoldController".constantize rescue super
  end
  
  def write_params(params, note)
    params.each do |k,v|
      logger.debug("#{note}: #{k.to_s}, #{v.to_s} class: #{v.class}")
    end
  end

  #    
  def index_init
    @stories = []
    trips = Trip.find(:all, :conditions => ['trips.end > ?', Time.now])
    @stories << trips if trips
    
    simple_stories = SimpleStory.find(:all, 
     :conditions => ['simple_stories.expiration_date_time > ?', Time.now])
    @stories << simple_stories if simple_stories
    
    dynamic_stories = DynamicStory.find(:all, 
     :conditions => ['dynamic_stories.expiration_date_time > ?', Time.now])
    @stories << dynamic_stories if dynamic_stories
  
    @stories.flatten!
    @stories.sort! { |x,y| 
      x.sort_date <=> y.sort_date 
    }
    logger.debug("stories")
    for story in @stories
      logger.debug("\tstory: #{story.class} #{story.id}")
    end
  end
    
end
