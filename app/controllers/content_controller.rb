class ContentController < ApplicationController

  layout "ubcsurf_default_layout"

  include ControllerLib
  
  def index
    # index_init
  end
  # this is pretty silly and not nec. restful, you can have actions w/ different names you just need
  # to define the resources they use and (maybe/i think) the action.
  def show
    # based on parameter switch between different partials
    partial = ""
    action = ""
    locals = {}
    
    index_init # sets @trips & stories
    
    case params[:content].to_sym
    when :home, :index
      flash[:message] = "" # message to be displayed in the flash/error box at the top of the page.
      partial = 'home'
    when :trips
      partial = 'trips'
    when :sponsors
      partial = 'sponsors'
    when :about
      partial = 'about'
    when :propaganda
      partial = 'propaganda'
    when :resources
      partial = 'resources'
    else
      partial = params[:content] 
    end
    logger.debug("partial: #{partial} locals: #{locals}")
    respond_to do |type|
      type.js {
        render :update do |page|
          #page.visual_effect :blind_up, 'content'
          page.visual_effect :blind_down, 'content'
          page.replace_html 'content' , :partial => partial, :locals => locals 
        end
      }
      type.html {
        render params.merge(:action => partial)
      }
    end
  end
  
  protected

end
