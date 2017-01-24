class Admin::MealsController < Admin::AdminController

	def index
		@meals=Meal.order("id desc").page(params[:page]).per(5).includes(:dinner)
	end
	def new
		@dinner=Dinner.find(params[:dinner_id])
		@meal=@dinner.meals.new
	end

	def create
		@dinner=Dinner.find(params[:dinner_id])
		@meal=@dinner.meals.new(meal_params)
		
		if @meal.save
			flash[:notice]="meal saved successfully"
			redirect_to admin_dinner_path(@dinner)
		else
			flash[:alert]="meal not saved "
			render 'new'
		end		
	end

	def show
		@dinner=Dinner.find(params[:dinner_id])
		@meal=Meal.find(params[:id])

		@photo = @meal.photos.new
	end

	def update

		@meal=Meal.find(params[:id])
		@dinner=Dinner.find(params[:dinner_id])

		if @meal.update(meal_params)	  		  	
	  	flash[:notice]="meal update successfully"
			redirect_to admin_dinner_path(@dinner)
		else
			flash[:alert]="dinner not saved "
			render 'new'
		end
		if params[:remove_photo]
			params[:remove_photo].each do |index, photo_id|
				photo = Photo.find(photo_id)
				photo.destroy
			end
		end
	end

	def destroy
		# raise
		@meal = Meal.find(params[:id])
		@dinner = @meal.dinner
		@meal.destroy
		redirect_to admin_dinner_path(@dinner)
	end

private

	def meal_params
		params.require(:meal).permit(:name,:discription,:style_id,:price,:calories,photos_attributes: [:avatar])
	end

end
