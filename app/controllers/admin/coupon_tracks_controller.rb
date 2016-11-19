class Admin::CouponTracksController < ApplicationController
	def destroy
		@user = User.find(params[:user_id])
		@coupon = CouponTrack.find(params[:coupon_id])
		@coupon.destroy

		redirect_to admin_user_path(@user)
	end
end
