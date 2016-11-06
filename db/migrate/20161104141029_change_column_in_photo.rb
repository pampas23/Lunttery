class ChangeColumnInPhoto < ActiveRecord::Migration[5.0]
  def change
  	rename_column :photos, :photoable_type, :phototable_type
  	rename_column :photos, :photoable_id, :phototable_id
  end
end
