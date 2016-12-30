class CreatePersons < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.integer :user_id
      t.string :name , null: false
      t.string :surname , null: false
      t.string :country , null:false
      t.string :address, null: false
      t.integer :addressNo , null: false
    end
  end
end
