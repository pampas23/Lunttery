class Admin::UserMealLikeshipsController < ApplicationController
	#to be up the upperclass
	before_action :admin_only
	def edit
		@meal=Meal.find(params[:meal_id])
		@user=User.find(params[:id])
		@dinner = Dinner.find(params[:dinner_id])

		if @meal.users.include?(@user)
			@like=@user.user_meal_likeships.find_by_meal_id(@meal)
			@like.destroy
			redirect_to admin_dinner_path(@dinner)
		else
			@user.meals<<@meal
			redirect_to admin_dinner_path(@dinner)
		end	
	end
	def admin_only
		if current_user&&current_user.role ='admin'

		else
			redirect_to dinners_path
		end	
	end
end
