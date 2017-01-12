class Reservation < ActiveRecord::Base

  belongs_to :user
  has_one :internet
  has_one :parking
  has_one :tv

end