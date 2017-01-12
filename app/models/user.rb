class User < ActiveRecord::Base

  has_one :person , dependent: :destroy
  has_many :reservations, dependent: :destroy

end