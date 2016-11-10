class Dinner < ApplicationRecord
	validates_presence_of :name
	delegate :meal, :to => :dinner, :prefix => true, :allow_nil => true

	has_many :meals
	belongs_to :style

	has_many :photos, :as => :phototable
	accepts_nested_attributes_for :photos
	def return_json
		return { 
			:id =>self.id,
			:name => self.name, 
			:address => self.address, 
			:lat => self.lat,
			:lng => self.lng,
			:style_id => self.style_id,
			# :photos =>self.photo.avatar.url,
			:photos_url => self.return_photo_url
		}		
	end
	def return_photo_url
		self.photos.each do |photo|
			return "/system/photos/avatars/000/000/#{photo.id}/original/#{photo.avatar_file_name}"
		end	
	end
end
