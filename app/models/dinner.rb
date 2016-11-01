class Dinner < ApplicationRecord
	validates_presence_of :name

	has_many :meals

	def return_json
		return { 

			:id =>self.id,
			:name => self.name, 
			:address => self.address 
			
		}
		
	end
end
