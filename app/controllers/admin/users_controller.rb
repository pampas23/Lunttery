class Admin::UsersController < ApplicationController
	layout "admin"
	before_action :admin_only
	def index
		@users=User.order("id desc").page(params[:page]).per(5)
	end
	def show
		@user=User.find(params[:id])
		@meals=@user.meals.includes(:style,:photos)
	end

	private
	def admin_only
		if current_user&&current_user.role ='admin'

		else
			redirect_to dinners_path
		end	
	end
end
