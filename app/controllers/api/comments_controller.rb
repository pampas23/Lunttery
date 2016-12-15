class Api::CommentsController < Api::ApiController
	def create
		@name = params[:name]
		@email = params[:email]
		@suggestion = params[:suggestion]

		@comment = Comment.create(:name => @name,:email => @email ,:suggestion =>@suggestion)

		render :json => {
				:response => :success
		}
	end
end