class AddNumberOfPersonsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :number_of_persons, :integer, null: false
  end
end
