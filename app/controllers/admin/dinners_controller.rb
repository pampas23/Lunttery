class Admin::DinnersController < ApplicationController
	before_action :find_dinner, :only =>[:show,:edit,:update,:destroy]
	layout "admin"
	def index
		# @dinners=Dinner.all
		@dinners=Dinner.order("id desc").page(params[:page]).per(5)
		
		if params[:id]
			@dinner=Dinner.find(params[:id])
			@sub = "更新"
		else
			@dinner=Dinner.new
			@sub="新增"
		end	
			@photo = @dinner.photos.new
	end

	def new
		@dinner=Dinner.new
	end

	def show		
		@meals = @dinner.meals
		@meal  = Meal.new
		@photo = @dinner.photos.new
	end

	def create
		@dinners=Dinner.page(params[:page]).per(5)
		@dinner=Dinner.new(dinner_params)
		
		
		if @dinner.save(dinner_params)
			# @dinner.photos.create(params[:avatar])
			# @dinner.save
			flash[:notice]="dinner saved successfully"
			redirect_to admin_dinners_path
		else
			flash[:alert]="dinner not saved "
			render "index"
		end		
	end

	def update
		@dinners=Dinner.order("id desc").page(params[:page]).per(5)
		if @dinner.update(dinner_params)	  		  	
	  	flash[:notice]="dinner update successfully"
			redirect_to admin_dinners_path
		else
			flash[:alert]="dinner not saved "
			render 'index'
		end
	end

	def destroy
		@dinner.destroy
		redirect_to admin_dinners_path
	end

	private

	def find_dinner
		@dinner=Dinner.find(params[:id])
	end

	def dinner_params
		params.require(:dinner).permit(:name,:zip,:district,:address,:lat,:lng,:style,:price_level,:style_id,:avatar,photos_attributes: [:avatar])
	end
end
