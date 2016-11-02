class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :registration
      t.references :user, foreign_key: true
      t.string :model
      t.string :brand

      t.timestamps
    end
  end
end
