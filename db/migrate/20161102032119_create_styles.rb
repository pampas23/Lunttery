class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.string :name

      t.timestamps
    end

    add_column :dinners, :style_id, :integer
   	remove_column :dinners , :style
  end
end
