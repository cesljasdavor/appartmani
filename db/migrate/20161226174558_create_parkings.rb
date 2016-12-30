class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.boolean :boolParking ,unique: true , null: false
      t.float :price
    end
  end
end
