class DinnersController < ApplicationController
	before_action :find_dinner, :only =>[:show]

	def index
		@meals=Meal.order("id desc").page(params[:page]).per(5).includes(:style,:photos,:users,:user_meal_likeships)
		if params[:id]
			@dinner=Dinner.find(params[:id])
			@sub = "更新"
		else
			@dinner=Dinner.new
			@sub="新增"
		end	
			@photo = @dinner.photos.new
	end

	private

	def find_dinner
		@dinner=Dinner.find(params[:id])
	end

end
