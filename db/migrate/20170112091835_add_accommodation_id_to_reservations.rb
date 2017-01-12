class AddAccommodationIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :accommodation_id, :integer, null: false
  end
end
