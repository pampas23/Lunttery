class AddOnsaleToDinner < ActiveRecord::Migration[5.0]
  def change
  	add_column :dinners, :onsale, :string, :default => "false"
  	add_column :dinners, :onsale_content, :string, :default => "not on sale"
  end
end
