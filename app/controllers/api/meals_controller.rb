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
			@price = params[:price].to_i
			@is_find = "true"

			@location = Geokit::LatLng.new(params[:lat],params[:lng])
			@dinners = Dinner.within(@distant,:origin => @location).includes(:meals => [:photos,:style ])
			@select_meals =[]
			@meals = @dinners.flat_map{ |d| d.meals }

			@meals.each do |meal|
				@style_ids.each do |style_id|
					if meal[:style_id] == style_id && meal.price < @price
						@select_meals << meal
					end
				end
			end

			if @select_meals == []
				@select_meals = Meal.all.sample(6)
				@is_find = "false"
			end

			if current_user
				my_like_meal_ids = current_user.user_meal_likeships.pluck(:meal_id)
				render :json => {
					:data => @select_meals.map{|meal| 
						h = meal.return_json
						h[:liked] = my_like_meal_ids.include?(meal.id)
						h[:distance] = @location.distance_from(meal.dinner , :units => :kms)
						h
					},
					:user_id => current_user.id,
					:is_find => @is_find
				}
			else
				render :json => {
					:data => @select_meals.map{|meal| 
						h = meal.return_json
						h[:liked] = false
						h[:distance] = @location.distance_from(meal.dinner , :units => :kms)
						h
						},
					:user_id => 	"nil",
					:is_find => @is_find
				}
			end
		end
	end

	def show
		@meal=Meal.find(params[:id])
		@lat = params[:lat]
		@lng = params[:lng]
		@location = Geokit::LatLng.new(params[:lat],params[:lng])
		@dinner = @meal.dinner

		if current_user
			my_like_meal_ids = current_user.user_meal_likeships.pluck(:meal_id)
			render :json => {
				:data => @meal.return_json,
				:distance => @location.distance_from(@meal.dinner , :units => :kms),
				:like => my_like_meal_ids.include?(@meal.id)
			}
		else
			render :json => {
				:data => @meal.return_json,
				:distance => @location.distance_from(@meal.dinner , :units => :kms),
				:like => false
			}
		end
	end

end
