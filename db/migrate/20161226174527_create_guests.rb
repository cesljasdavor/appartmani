class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :reservation_id , foreign_key: true
      t.integer :number_of_persons
      t.integer :grown_ups
    end
  end
end
