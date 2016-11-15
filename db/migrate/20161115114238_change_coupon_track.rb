class ChangeCouponTrack < ActiveRecord::Migration[5.0]
  def change
  	rename_column :coupon_tracks, :meal_id, :dinner_id
  end
end
