class CreateTvs < ActiveRecord::Migration
  def change
    create_table :tvs do |t|
      t.boolean :boolTv ,unique: true , null: false
      t.float :price
    end
  end
end
