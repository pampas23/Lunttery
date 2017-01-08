class Meal < ApplicationRecord
	belongs_to :dinner
	belongs_to :style
	has_many :user_meal_likeships,:dependent => :destroy
	has_many :users,:through => :user_meal_likeships
	validates_presence_of :name
	delegate :name, :to => :meal, :prefix => true, :allow_nil => true
	delegate :discription, :to => :meal, :prefix => true, :allow_nil => true
	delegate :price, :to => :meal, :prefix => true, :allow_nil => true
	delegate :style_id, :to => :meal, :prefix => true, :allow_nil => true

	has_many :photos, :as => :phototable, :dependent => :destroy
	accepts_nested_attributes_for :photos

	def return_json
		{ 
			:id =>self.id,
			:dinner_id => self.dinner_id,
			:name => self.name, 
			:discription => self.discription,
			:price =>self.price ,
			:style => self.style.name,
			:carories => self.calories,
			:liked_counts =>self.user_meal_likeships_count,
			:photos_urls => self.return_photo_url,
			:dinner =>self.dinner
		}		
	end

	def return_photo_url
		# select_photos = self.photos.includes(:avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at)
		# self.photos.map do |photo|
		if photos.first
		return	[ApplicationController.helpers.asset_url( photos.first.avatar.url(:medium) )]
		# 		"test_url"
		# end
		else
		"test_url"
		end
	end
	def photo_url
		self.photos.map do |photo|
				return	ApplicationController.helpers.asset_url( photo.avatar.url(:medium) )
		end
	end
end