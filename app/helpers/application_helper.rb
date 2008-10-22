# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # show_hide_div_id - the div to blind up/down
  # link_id_string - the snippet of the id that ... unique on this page.
  # options
  #   :text => '' Text for both links, overrides 
  #   :up_text => '' link text for open condition
  #   :down_text => '' link text for closed condition
  #   :show => true, open the div initially, default, closed if both spec. closed
  #   :hide => true, close the div initially, 
  def up_down_link(show_hide_div_id, options = {})
    css_id = show_hide_div_id 
    #link_css_id = params[:link_css_id]
    initially_hidden = true
    controller = nil
    up_link_text = nil 
    down_link_text = nil 
   
    # assert class show, hide: boolean
    # show_hide_div_id: string
    # controller: symbol or string
    # text, up_link, up_link_text, down_link_text: string
 
    logger.debug("options: #{options} up_link_text: #{up_link_text} options text: #{options[:text]}")
   
    up_link_text ||= options[:text] 
    logger.debug("options: #{options} up_link_text: #{up_link_text} options text: #{options[:text]}")
    #up_link_text ||= options[:up_link_text] 
    down_link_text ||= options[:text] 
    #down_link_text ||= options[:down_link_text] 
    #initially_hidden &&= options[:show] ## if show == false initially_hidden 
    #initially_hidden &&= !options[:hide] ## ih is true/false
    controller ||= options[:controller]

    down_html_options = {:id => "#{css_id}_down"}
    up_html_options = {:id => "#{css_id}_up"}
    if initially_hidden
      up_html_options[:style] = "display:none;" 
    else
      down_html_options[:style] = "display:none;" 
    end
   
    # ignoring initially_hidden for now. 
    down_link = link_to_remote up_link_text, :url => {:action => :up_down_link, :value => :down, :css_id => css_id}, 
     :html => down_html_options 
    up_link = link_to_remote down_link_text, :url => {:action => :up_down_link, :value => :up, :css_id => css_id}, 
     :html => up_html_options 
    #up_link = link_to_remote down_link_text, :url => {:action => :up_down_link, :value => :down, :css_id => css_id}, 
    # :html => {:id => "#{css_id}_up"}

    logger.debug("#{down_link} #{up_link}")

    return down_link + " " + up_link
  end 

  FLASH_NOTICE_KEYS = [:error, :notice, :warning]

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|      
      content_tag :div, :id => 'flash', :class => type.to_s do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    formatted_messages.join
  end
  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
  end
  def if_admin?
    yield if logged_in? && current_user.has_role?('admin')
  end
  def if_logged_in?
    yield if logged_in?
  end
  def if_recaptcha?
    yield if @bad_visitor
  end
  def in_beta?
    APP_CONFIG['settings']['in_beta']
  end
  def if_in_beta?
    yield if in_beta?
  end
  def unless_in_beta?
    yield unless in_beta?
  end
  def if_invites_available?
    yield if in_beta? and logged_in? and (current_user.invitation_limit > 0)
  end
  def focus_on_div(div)
    update_page do |page|
      page[div].focus
    end
  end
  def image_form_column(record, input_name)
    file_field :record, :uploaded_data, :name => input_name
  end
end
