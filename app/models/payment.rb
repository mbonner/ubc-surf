class Payment < ActiveRecord::Base
  has_one :trip_enrollment
end
