class CreateCarsTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :cars_types, id: :string do |t|
      t.string :car_type, unique: true

      t.timestamps
    end
  end
end
