class ChangeDeafaultDinnerPhoneNumber < ActiveRecord::Migration[5.0]
  def change
  	change_column :dinners, :phone_number,:string , :default => " "
  end
end
