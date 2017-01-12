class UpdateAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :accommodation_type, :integer, null: false
    add_column :accommodations, :view, :boolean, null: false
    add_column :accommodations, :appartment, :boolean, null: false
  end
end
