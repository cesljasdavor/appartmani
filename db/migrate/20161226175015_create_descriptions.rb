class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.integer :accommodation_id ,foreign_key: true
      t.string :description
    end
  end
end
