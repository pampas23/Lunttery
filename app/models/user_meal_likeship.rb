class UserMealLikeship < ApplicationRecord
	belongs_to :user
	belongs_to :meal,:counter_cache => true
end
