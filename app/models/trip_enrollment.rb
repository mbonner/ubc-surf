class TripEnrollment < ActiveRecord::Base

  belongs_to :trip
  belongs_to :payment

  def name 
    first_name && last_name ? first_name + " " + last_name : "-"
  end

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :trip_id
  validates_presence_of :email_address
  validates_presence_of :phone
  # validates_format_of :email_address, :with =>  /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i

  # def validate
  # 
  #   # debug(self) -- how
  #   if self.email_address && !self.email_address.empty? && 
  #    self.email_address !~ /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i
  #     errors.add(:email_address, "Invalid format")
  #   end
  #   if self.phone
  #     self.phone.gsub!(/[\s)(\.-]/, '') 
  #     if phone.length != 10 || phone !~ /^(\s*[0-9]\s*)+$/
  #       errors.add(:phone, 'must be 10 digits, excluding special characters such as spaces and dashes. No extension or country code allowed.')
  #     end
  #   end
  #   
  #   if self.rent
  #     # make sure everything else has been set, if required.
  #     if self.gloves
  #       # assert size
  #     end
  #     if self.suit
  #       # assert presence of height & weight or suit_size
  #       if self.suit_size
  #       elsif (self.height && self.weight)
  #         # assert they match a certain format, maybe \d'\d'' or \dft\din or \f\m \fmetres \fmeters
  #         # or maybe just assert it has length.
  #       elsif self.height && !self.weight
  #         errors.add(:suit, "Your height has been set but not your weight, you must set both")
  #       elsif self.weight && !self.height
  #         errors.add(:suit, "Your weight has been set but not your height, you must set both")
  #       end
  #       if self.gloves
  #         if !self.glove_size
  #           errors.add(:gloves, "Gloves has been set but not size")
  #         end
  #       else
  #         if self.glove_size
  #           errors.add(:gloves, "Gloves has not been set but not size")
  #         end
  #       end
  #       if self.hoody
  #       end
  #       if self.booties
  #         if !self.booty_size
  #           errors.add(:booties, "Booties has been set but not size")
  #         end
  #         if !self.shoe_size_type
  #           errors.add(:booties, "Booties has been set but not male/female")
  #         end
  #       else
  #         if self.booty_size 
  #           errors.add(:booties, "Booties has not been set booty size has been set")
  #         end
  #       end
  #     else
  #       # assert !suit stuff
  #       if self.suit_size || self.height || self.weight
  #         errors.add(:suit, "Suit is nil yet size, height, or weight has been set")
  #       end
  #     end
  #   else
  #     # assert none of the rental vars have been set.
  #   end
  #   if self.driver
  #     # assert presence of capacity
  #     if !self.car_capacity && self.car_capacity <= 0
  #       errors.add(:driver, 
  #        "If you are a driver your car capacity must be set to the number of people, including yourself, that can fit in your car, if you have something stupid in your trunk, like say a giant subwoofer that isnt even hooked up, remove the thing you dumbass (this is known as the ryan rule).")
  #     end
  #   end
  #   if self.tent
  #     # assert presence of capacity
  #   end
  #   if self.stove
  #   end
  #   if self.tarp
  #   end
  # end

  protected
  
  def after_create
    # email notes to ubcsurf@gmail.com perhaps?
    # email sinup confirmation email.
    # could use an observer
  end

  private

end
