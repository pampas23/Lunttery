class Api::UserMealLikeshipsController < Api::ApiController
	def edit
		@meal=Meal.find(params[:meal_id])
		@user=User.find(params[:id])

		if @meal.users.include?(@user)
			@like=@user.user_meal_likeships.find_by_meal_id(@meal)
			@like.destroy
			render :json => {:data => "User dislike meal",:liked_counts => @meal.users.count }
		else	
			@user.meals<<@meal
			render :json => {:data => "User like meal",:liked_counts => @meal.users.count }
		end
	end
end
