class CreateDinners < ActiveRecord::Migration[5.0]
  def change
    create_table :dinners do |t|
      t.string :name
      t.text :discription
      t.integer :zip
      t.string :district
      t.integer :address
      t.decimal :lat
      t.decimal :lng
      t.string :style
      t.integer :price_level

      t.timestamps
    end

    add_index :dinners, :name
  end

end
