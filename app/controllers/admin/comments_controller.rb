class Admin::CommentsController < Admin::AdminController

	def index
		@comments=Comment.order("id desc").page(params[:page]).per(5)
	end
	
end
