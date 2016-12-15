class Admin::CommentsController < ApplicationController
	before_action :admin_only
	layout "admin"
	def index
		@comments=Comment.order("id desc").page(params[:page]).per(5)
	end

	private
	def admin_only
		if current_user&&current_user.role =='admin'

		else
			redirect_to dinners_path
		end	
	end
end
