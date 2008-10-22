module ControllerLib
  def up_down_link
    blind_action = params[:value].to_sym
    css_id = params[:css_id]
    #link_css_id = params[:link_css_id]

    logger.debug("passed blid_action: #{blind_action} class: #{blind_action.class}")
    logger.debug("passed css id: #{css_id} class: #{css_id.class}")
 
    render :update do |page|
      if blind_action == :up
        #page.hide "#{css_id}_summary"
        page.hide "#{css_id}_up"
        page.show "#{css_id}_down"
        page.visual_effect :blind_up, css_id 
      elsif blind_action == :down  
        page.hide "#{css_id}_down"
        page.show "#{css_id}_up"
        page.visual_effect :blind_down, css_id 
        #page.show"#{css_id}_summary"
      end
    end
  end 
end
