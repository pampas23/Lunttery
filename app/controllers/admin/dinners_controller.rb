class Admin::DinnersController < ApplicationController
	before_action :find_dinner, :only =>[:show,:edit,:update,:destroy]
	#to be up the upperclass
	before_action :admin_only
	layout "admin"
	def index
		@dinners=Dinner.order("id desc").page(params[:page]).per(5).includes(:style,:photos)
		
		if params[:id]
			@dinner=Dinner.find(params[:id])
			@sub = "更新"
		else
			@dinner=Dinner.new
			@sub="新增"
		end	

	end

	def new
		@dinner=Dinner.new
	end

	def show		
		@meals = @dinner.meals.includes(:style,:photos)
		@meal  = Meal.new
		@photo = @dinner.photos.new
	end

	def create
		
		@dinners=Dinner.page(params[:page]).per(5)
		@dinner=Dinner.new(dinner_params)

		if @dinner.save(dinner_params)
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
		if params[:remove_photo]
			params[:remove_photo].each do |index, photo_id|
				photo = Photo.find(photo_id)
				photo.destroy
			end
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
		params.require(:dinner).permit(:name,:zip,:district,:address,:lat,:lng,:style,:price_level,:style_id,:phone_number,:onsale,:onsale_content,:avatar,photos_attributes: [:avatar])
	end

	def admin_only
		if current_user&&current_user.role =='admin'

		else
			redirect_to dinners_path
		end	
	end
end
