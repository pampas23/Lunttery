class Api::UsersController < Api::ApiController
	def show
		@user=User.find(params[:id])
		@lat = params[:lat]
		@lng = params[:lng]
		@location = Geokit::LatLng.new(params[:lat],params[:lng])

		if @user
			render :json => {
					:data => @user.meals.map{|meal| meal.return_json
					h = meal.return_json
					h[:distant]=@location.distance_from(meal.dinner , :units => :kms)
					h
					}
				}
		else
			render :json => {
					:data => "no user"
				}			
		end	
	end
end
