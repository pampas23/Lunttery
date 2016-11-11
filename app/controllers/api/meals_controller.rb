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
			if current_user
			render :json => {
				:data => @meals.map{|meal| meal.return_json},
				:user_liked_meal => @meals.map{|meal| current_user.meals.include?(meal)}
			}
			else
			render :json => {
				:data => @meals.map{|meal| meal.return_json},
				:user => 	"nil"
			}
			end
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
