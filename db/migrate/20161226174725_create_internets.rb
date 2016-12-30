class CreateInternets < ActiveRecord::Migration
  def change
    create_table :internets do |t|
      t.boolean :boolInternet ,unique: true , null: false
      t.float :price
    end
  end
end
