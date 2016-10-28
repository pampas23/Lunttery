class DinnersController < ApplicationController
	before_action :find_dinner, :only =>[:show,:edit,:update]

	def index
		# @dinners=Dinner.all
		@dinners=Dinner.page(params[:page]).per(5)

		if params[:id]
			@dinner=Dinner.find(params[:id])
			@sub = "更新"
		else
			@dinner=Dinner.new
			@sub="新增"
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



	def update
		if @dinner.update(dinner_params)	  		  	
	  	flash[:notice]="dinner update successfully"
			redirect_to dinners_path
		else
			flash[:alert]="dinner not saved "
			render 'index'
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
