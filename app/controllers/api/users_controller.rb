class Api::UsersController < Api::ApiController
	def show
		@user=User.find(params[:id])
		if @user
			render :json => {
					:data => @user.meals.map{|meal| meal.return_json}
				}
		else
			render :json => {
					:data => "no user"
				}			
		end	
	end
end
