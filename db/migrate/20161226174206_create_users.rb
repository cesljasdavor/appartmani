class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email ,unique: true , null: false
      t.string :password ,null:false
      t.integer :privilege , default: 0
    end
  end
end
