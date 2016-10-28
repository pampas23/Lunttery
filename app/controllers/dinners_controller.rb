class DinnersController < ApplicationController
	before_action :find_dinner, :only =>:show

	def index
		# @dinners=Dinner.all
		@dinners=Dinner.page(params[:page]).per(5)

		if @dinner
			@dinner=Dinner.find(params[:id])
		else
			@dinner=Dinner.new
		end	
	end

	def show		
		
	end

	def create
		@dinner=Dinner.new(dinner_params)
		if @dinner.save(dinner_params)
			flash[:notice]="dinner saved successfully"
			redirect_to dinners_path
		else
			flash[:alert]="dinner not saved "
			render "index"
		end		
	end

	private

	def find_dinner
		@dinner=Dinner.find(params[:id])
	end

	def dinner_params
		params.require(:dinner).permit(:name,:zip,:district,:address,:lat,:lng,:style,:price_level)
	end
end
