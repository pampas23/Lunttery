class DinnersController < ApplicationController
	before_action :find_dinner, :only =>:show

	def index
		# @dinners=Dinner.all
		@dinners=Dinner.page(params[:page]).per(5)
	end

	def show		
		
	end

	private

	def find_dinner
		@dinner=Dinner.find(params[:id])
	end
end
