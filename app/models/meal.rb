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
end