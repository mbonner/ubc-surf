class TripEnrollmentAdminController < ApplicationController

  layout "ubcsurf_default_layout"

  before_filter :login_required

  active_scaffold :trip_enrollments do |config|
    config.columns << :name
    config.list.columns = [:name, :phone, :email_address, :rent, :driver]
    config.columns[:rent].form_ui = :checkbox
    config.columns[:driver].form_ui = :checkbox
    config.columns[:suit].form_ui = :checkbox
    config.columns[:know_suit_size].form_ui = :checkbox
    config.columns[:hoody].form_ui = :checkbox
    config.columns[:booties].form_ui = :checkbox
    config.columns[:tent].form_ui = :checkbox
    config.columns[:gloves].form_ui = :checkbox
    config.columns[:tarp].form_ui = :checkbox
    config.columns[:stove].form_ui = :checkbox
    config.columns[:first_name].required = true
    config.columns[:last_name].required = true
    config.columns[:phone].required = true
    config.columns[:email_address].required = true
    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = {:cols => 50, :rows => 10}
        
    config.create.columns = [:first_name, :last_name, :email_address, :phone, 
     :driver, :car_capacity, 
     :rent, :board_type, 
     :suit, :know_suit_size, :suit_size, :height, :weight, 
     :gloves, :glove_size, 
     :hoody, 
     :booties, :booty_size, :shoe_size_type,
     :tent, :tent_capacity, :tarp, :stove,
     :notes]
    # config.create.columns.exclude :payment
    config.update.columns.exclude :payment
    # config.create.columns.exclude :name
    config.update.columns.exclude :name
        
    config.action_links.add :list_print_view
    config.action_links[:list_print_view].label = 'Printable List'
    config.action_links[:list_print_view].type = :table
    config.action_links[:list_print_view].inline = false
    config.action_links[:list_print_view].page = true 
    config.action_links[:list_print_view].popup = true   
    
    config.action_links.add :drivers_print_view
    config.action_links[:drivers_print_view].label = 'Drivers'
    config.action_links[:drivers_print_view].type = :table
    config.action_links[:drivers_print_view].inline = false
    config.action_links[:drivers_print_view].page = true 
    config.action_links[:drivers_print_view].popup = true
    
    config.action_links.add :renters_print_view
    config.action_links[:renters_print_view].label = 'Renters'
    config.action_links[:renters_print_view].type = :table
    config.action_links[:renters_print_view].inline = false
    config.action_links[:renters_print_view].page = true 
    config.action_links[:renters_print_view].popup = true    
  end  
  
  def list_print_view
    write_params params, "list_print_view"
    do_list
    # render params.merge(:action => :list), :layout => 'print_view'
    # render params.merge(:action => :list, :layout => "print_view")
    render params.merge(:action => 'list_print_view.rhtml', :layout => "print_view")
  end
  def drivers_print_view
    write_params params, "list_print_view"
    do_list
    @num_people = @records.length
    @car_capacity = 0
    for record in @records
      if record.driver 
        @car_capacity += record.car_capacity
      end
    end
    render params.merge(:action => 'drivers_print_view.rhtml', :layout => "print_view")    
  end
  def renters_print_view
    do_list
    render params.merge(:action => 'renters_print_view.rhtml', :layout => "print_view") 
  end
end
