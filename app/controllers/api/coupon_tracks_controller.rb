class Api::CouponTracksController < Api::ApiController
	def edit
		@dinner=Dinner.find(params[:dinner_id])
		@user=User.find(params[:id])

		if @user&&@dinner
			@sale = false
			@message = "一天只能領取一次喔"

			if @user.coupon_tracks == []
				@user.coupon_used << @dinner
				@sale = true
				@message = "領取餐券成功"

			else 
				@cd_hour = (Time.now - @user.coupon_tracks.last.created_at)/3600
				if @cd_hour < 16

				else
					@user.coupon_used << @dinner
					@sale = true
					@message = "領取餐券成功"
				end			
			end

			render :json => {
				:can_use_cupon => @sale,
				:message =>@message,
				:user => @user,
				:dinner => @dinner,
				:last_used_coupon => @user.coupon_tracks.where(:dinner => @dinner).last,
				:last_coupon_used => @user.coupon_tracks.last.created_at,
				:past_time => @cd_hour,
			}
		else
			render :json => {
				:data => "no data"
			}
		end
	end
end