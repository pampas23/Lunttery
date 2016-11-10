class Api::MealsController < Api::ApiController
	def index
		
		if (params[:id])
			@meal=Meal.find(params[:id])
			render :json => {
				:data => @meal.return_json
			}
		else
			#temporary give 5 meal
			@meals=Meal.all.sample(5)
			render :json => {
				:data => @meals.map{|d| d.return_json}
			}
		end
		# redirect_to dinners_path
	end

	def show
		@meal=Meal.find(params[:id])
		@dinner = @meal.dinner
			render :json => {
				:data => @meal.return_json
			}
	end

end
