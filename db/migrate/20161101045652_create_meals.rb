class CreateMeals < ActiveRecord::Migration[5.0]
  def change
	rename_column :meals, :diiner_id, :dinner_id
  end
end
