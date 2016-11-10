class AddPhoneCaloriesToDinner < ActiveRecord::Migration[5.0]
  def change
  	add_column :dinners, :phone_number, :string, :default => "no data"
  	add_column :meals, :calories, :integer, :default => 0
  end
end
