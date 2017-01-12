class Accommodation < ActiveRecord::Base

  has_many :reservations, dependent: :destroy
  has_one :description, dependent: :destroy
  has_many :photos, dependent: :destroy
end