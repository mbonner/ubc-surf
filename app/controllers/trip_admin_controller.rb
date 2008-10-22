class TripAdminController < ApplicationController

  layout "ubcsurf_default_layout"

  before_filter :login_required

  active_scaffold :trips do |config|
    config.list.columns = [:title, :cost, :camping, :start, :end]
    config.create.columns = [:title, :cost, :start, :end, :camping, :description, :sidebar_content,
     :meeting_location, :meeting_location_link, :embedded_meeting, :trip_meeting_location_map_link,
     :location, :location_link, :embedded_location, :trip_location_map_link, 
     :board_rental_cost, :booty_rental_cost, :glove_rental_cost, :suit_rental_cost, :total_rental_cost,
     :driver_discount,
     :image
    ]
    config.update.columns = [:title, :cost, :start, :end, :camping, :description, :sidebar_content,
     :meeting_location, :meeting_location_link, :embedded_meeting, :trip_meeting_location_map_link,
     :location, :location_link, :embedded_location, :trip_location_map_link, 
     :board_rental_cost, :booty_rental_cost, :glove_rental_cost, :suit_rental_cost, :total_rental_cost,
     :driver_discount,
     :image
    ]
    config.columns[:description].description = "<br />"
    config.columns[:trip_meeting_location_map_link].description = "<br />"
    config.columns[:trip_location_map_link].description = "<br />"
    config.columns[:total_rental_cost].description = "<br />"
    config.columns[:description].form_ui = :textarea
    config.columns[:description].options = {:cols => 50, :rows => 10}    
    config.columns[:description].description = "This will summarize the trip and appear in the home page."
    config.columns[:camping].form_ui = :checkbox
    
    config.create.columns.exclude :trip_enrollments
    
    config.nested.add_link("Sign ups", [:trip_enrollments])
  end
end
