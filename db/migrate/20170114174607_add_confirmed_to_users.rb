class AddConfirmedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirm_status, :integer, default: 0
  end
end
