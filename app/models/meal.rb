class Meal < ApplicationRecord
	belongs_to :dinner
	belongs_to :style
	validates_presence_of :name

	has_many :photos, :as => :phototable
	accepts_nested_attributes_for :photos
end