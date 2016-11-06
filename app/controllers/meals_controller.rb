class MealsController < ApplicationController

	def new
		@dinner=Dinner.find(params[:dinner_id])
		@meal=@dinner.meals.new

	end

	def create
		@dinner=Dinner.find(params[:dinner_id])
		@meal=@dinner.meals.new(meal_params)
		
		if @meal.save
			flash[:notice]="meal saved successfully"
			redirect_to dinner_path(@dinner)
		else
			flash[:alert]="meal not saved "
			render 'new'
		end		
	end

private

def meal_params
	params.require(:meal).permit(:name,:discription,:style_id,:price)
end

end
