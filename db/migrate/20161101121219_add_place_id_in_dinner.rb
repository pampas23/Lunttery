class AddPlaceIdInDinner < ActiveRecord::Migration[5.0]
  def change
  	add_column :dinners, :place_id, :string
  end
end
