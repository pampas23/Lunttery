class Admin::UsersController < Admin::AdminController
	def index
		@users=User.order("id desc").page(params[:page]).per(5)
	end
	def show
		@user=User.find(params[:id])
		@meals=@user.meals.includes(:style,:photos)
	end

end
