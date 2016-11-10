class Meal < ApplicationRecord
	belongs_to :dinner
	belongs_to :style
	validates_presence_of :name
	delegate :name, :to => :meal, :prefix => true, :allow_nil => true
	delegate :discription, :to => :meal, :prefix => true, :allow_nil => true
	delegate :price, :to => :meal, :prefix => true, :allow_nil => true
	delegate :style_id, :to => :meal, :prefix => true, :allow_nil => true

	has_many :photos, :as => :phototable
	accepts_nested_attributes_for :photos

	def return_json
		{ 
			:id =>self.id,
			:dinner_id => self.dinner_id,
			:name => self.name, 
			:discription => self.discription,
			:price =>self.price ,
			:style_id => self.style_id,
			:photos_urls => self.return_photo_url
		}		
	end

	def return_photo_url
		self.photos.map do |photo|
		return	ApplicationController.helpers.asset_url( photo.avatar.url )
			#{}"/system/photos/avatars/000/000/#{photo.id}/original/#{photo.avatar_file_name}"
		end	
	end
end