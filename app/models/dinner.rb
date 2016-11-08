class Dinner < ApplicationRecord
	validates_presence_of :name

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
			:pics =>self.photos
		}		
	end

end
