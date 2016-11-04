class MealsController < ApplicationController

	def new
		@meal=Meal.new	
	end

	def create
		@dinner=Dinner.find_by(params[:id])
		@meal=Meal.new(meal_params)
		@meal.dinner=@dinner
		if @meal.save(meal_params)
			flash[:notice]="meal saved successfully"
			redirect_to dinner_path(@dinner)
		else
			flash[:alert]="meal not saved "
			render 'show'
		end		
	end

private

def meal_params
	params.require(:meal).permit(:name,:discription,:style_id,:price)
end

end
