class AddTableMeal < ActiveRecord::Migration[5.0]
  def change
  	create_table :meals do |t|
      t.string :diiner_id
      t.string :name
      t.text :discription
      t.integer :price
      t.integer :style_id

      t.timestamps
		end
		add_index :meals, :name
  end
end
