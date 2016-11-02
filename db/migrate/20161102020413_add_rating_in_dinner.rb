class AddRatingInDinner < ActiveRecord::Migration[5.0]
  def change
  	add_column :dinners, :rating, :float
  end
end
