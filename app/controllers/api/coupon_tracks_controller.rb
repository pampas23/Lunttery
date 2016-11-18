class Api::CouponTracksController < Api::ApiController
	def edit
		@dinner=Dinner.find(params[:dinner_id])
		@user=User.find(params[:id])

		if @user&&@dinner
			@sale = false
			@message = "目前沒有優惠喔"

			if @dinner.onsale == "true"
				@message = "領取餐券成功"	
				
				if @user.coupon_tracks == []
					@user.coupon_used << @dinner
					@sale = true					
					@last_coupon_used = nil
				else 
					@cd_hour = (Time.now - @user.coupon_tracks.last.created_at)/3600
					@last_coupon_used = @user.coupon_tracks.last.created_at
					
					if @cd_hour < 20
						@message = "一天只能領一次喔"
					else
						@user.coupon_used << @dinner
						@sale = true
					end
				end

				render :json => {
					:can_use_cupon => @sale,
					:message =>@message,
					:user => @user,
					:dinner => @dinner,
					:last_used_coupon => @user.coupon_tracks.where(:dinner => @dinner).last,
					:last_coupon_used => @last_coupon_used,
					:past_time => @cd_hour,
				}
			else
				render :json => {
					:can_use_cupon => @sale,
					:message =>@message,
					:user => @user,
					:dinner => @dinner,
					:last_used_coupon => nil,
					:last_coupon_used => nil,
					:past_time => nil,
				}
			end
		end
	end
end