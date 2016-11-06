class AddTablePhoto < ActiveRecord::Migration[5.0]
  def change
  	create_table :photos do |t|
	t.integer :photoable_id
  	t.string :photoable_type
  	t.string :name      
  	t.attachment :avatar
      t.timestamps
	end
  end
end
