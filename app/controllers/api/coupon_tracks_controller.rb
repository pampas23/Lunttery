class Api::CouponTracksController < Api::ApiController
	def edit
		dinner=Dinner.find(params[:dinner_id])
		user=User.includes(:coupon_tracks).find(params[:id])

		if user&&dinner
			sale, message, last_coupon_used, cd_hour = user.use_coupon(dinner)
				render :json => {
					:can_use_cupon => sale,
					:message => message,
					:dinner => dinner,
					:last_used_coupon => user.coupon_tracks.where(:dinner => dinner).last,
					:last_coupon_used => last_coupon_used,
					:past_time => cd_hour
				}
		end

	end
end