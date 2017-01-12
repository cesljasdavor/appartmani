class AddUserIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :user_id, :integer, null: false
  end
end
