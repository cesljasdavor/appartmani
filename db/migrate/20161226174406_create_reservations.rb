class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :dateFrom , null: false
      t.datetime :dateTo , null: false
      t.boolean :boolTv , default: false, foreign_key: true
      t.boolean :boolParking , default: false, foreign_key: true
      t.boolean :boolInternet , default: false, foreign_key: true
      t.timestamps
    end
  end
end
