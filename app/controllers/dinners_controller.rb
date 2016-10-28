class DinnersController < ApplicationController
	def index
		# @dinners=Dinner.all
		@dinners=Dinner.page(params[:page]).per(5)
	end

end
