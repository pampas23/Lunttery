class DinnersController < ApplicationController
	def index
		@dinners=Dinner.all
	end

end
