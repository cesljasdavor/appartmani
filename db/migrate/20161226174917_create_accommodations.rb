class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :name ,unique: true , null: false
      t.integer :personsFrom
      t.integer :personsTo
    end
  end
end
