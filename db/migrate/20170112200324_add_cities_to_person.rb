class AddCitiesToPerson < ActiveRecord::Migration
  def change
    add_column :persons, :city, :string, null: false
  end
end
