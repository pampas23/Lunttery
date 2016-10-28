class ChangeDinnerAdressType < ActiveRecord::Migration[5.0]
  def change
  	change_column :dinners, :address, :string
  end
end
