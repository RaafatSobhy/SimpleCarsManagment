class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars, id: :string do |t|
      t.string :name
      t.decimal :horsepower
      t.decimal :price
      t.string :cars_type_id

      t.timestamps
    end
    add_index :cars, :car_type_id
    add_foreign_key :cars ,:cars_types
  end
end
