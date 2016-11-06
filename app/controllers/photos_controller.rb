class PhotosController < ApplicationController
	def new
		@photo=Photo.new
	end

	def create
		@photo=Photo.find(params[:id])
		@photo.save
	end

	def update
		@photo=Photo.find(params[:id])
		@photo=@photo.update(photo_params)
		
		redirect_to dinners_path
	end

	private

	def photo_params
		params.require(:photo).permit(:id,:avatar)
	end
	
end
