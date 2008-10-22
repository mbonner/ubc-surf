class Trip < ActiveRecord::Base

  has_one :image, :as => :owner
  has_many :trip_enrollments
  
  # make validations!
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :start
  validates_presence_of :end
  validates_presence_of :cost

  def sort_date
    return self.end
  end
    
  def self.create_first_trip
    # always id one.
    begin
      Trip.transaction do 
if false
        Trip.delete 1
        trip = Trip.new
        #raise "created trip: #{trip}"
        #trip.id = 1
        trip.title = "September 12-14 Camping Trip to Beautiful Tofino"
        trip.start = Time.local(2008, 9, 12, 15)
        trip.end = Time.local(2008, 9, 14, 22)
        trip.cost = 170.00
        trip.description = "We are heading to tofino and camping at the long beach golf course campground.  Tofino is an amazingly beautiful place and the surf can be pretty damn sweet, hopefully the weather and the swells will cooperate for our trip, but rest assured, if if we have no swell the waves are always ridable and even if we get pissed on this trip is always a ton of fun and for a lot of people this is their most memorable trip."
        trip.meeting_location = "Gage Towers at ubc."
        trip.meeting_location_link = "http://maps.google.com/maps?f=q&hl=en&geocode=&q=gage+towers+ubc&sll=37.0625,-95.677068&sspn=72.4815(...)" 
        trip.embedded_meeting = ""
        trip.location = "Tofino Golf Course Campground"
        trip.location_link = "http://www.longbeachgolfcourse.com/site/campground.html"
        trip.embedded_location = '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=49.08078,-125.78393&amp;ie=UTF8&amp;ll=49.093316,-125.775604&amp;spn=0.060266,0.178185&amp;t=h&amp;z=13&amp;iwloc=addr&amp;output=embed&amp;s=AARTsJr5Z30HmHp0P1DsSUD-umDI7STfLQ"></iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=49.08078,-125.78393&amp;ie=UTF8&amp;ll=49.093316,-125.775604&amp;spn=0.060266,0.178185&amp;t=h&amp;z=13&amp;iwloc=addr&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map</a></small>'
        trip.camping = true

        trip.save
end
        # surfs inn
        #trip.embedded_location = '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=surfs+inn+tofino&amp;ie=UTF8&amp;ll=48.949845,-125.542488&amp;spn=0.015108,0.024977&amp;t=h&amp;z=14&amp;iwloc=A&amp;cid=48941304,-125546736,13041506419241472374&amp;output=embed&amp;s=AARTsJoFmxbalZrzR2LawMwT77VTm7IWVA"></iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=surfs+inn+tofino&amp;ie=UTF8&amp;ll=48.949845,-125.542488&amp;spn=0.015108,0.024977&amp;t=h&amp;z=14&amp;iwloc=A&amp;cid=48941304,-125546736,13041506419241472374&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map</a></small>'

      end
    rescue Exception => e
      raise e
    else
    end 
  end
end
