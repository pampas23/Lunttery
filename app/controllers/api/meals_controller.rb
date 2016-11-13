class Api::MealsController < Api::ApiController
	def index
		
		if (params[:id])
			@meal=Meal.find(params[:id])
			render :json => {
				:data => @meal.return_json
			}
		else
			@lat = params[:lat]
			@lng = params[:lng]
			@distant = params[:distant]
			@style_ids = params[:style_ids].split(",").map { |s| s.to_i }

			@location = Geokit::LatLng.new(params[:lat],params[:lng])
			@dinners = Dinner.within(@distant,:origin => @location).includes(:meals)
			
			@select_meals =[]
			@meals = @dinners.flat_map{ |d| d.meals }

			@meals.each do |meal|
				@style_ids.each do |style_id|
					if meal[:style_id] == style_id
						@select_meals << meal
					end
				end
			end


			if current_user
				my_like_meal_ids = current_user.user_meal_likeships.pluck(:meal_id)
				render :json => {
					:data => @select_meals.map{|meal| 
						h = meal.return_json
						h[:liked] = my_like_meal_ids.include?(meal.id)
						h[:distance] = @location.distance_from(meal.dinner , :units => :kms)
						h
					}
				}
			else
				render :json => {
					:data => @select_meals.map{|meal| meal.return_json},
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
