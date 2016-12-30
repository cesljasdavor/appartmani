class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :accommodation_id ,foreign_key: true
    end
  end
end
