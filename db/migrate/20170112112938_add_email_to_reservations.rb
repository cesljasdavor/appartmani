class AddEmailToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :email, :string, null: false
  end
end
