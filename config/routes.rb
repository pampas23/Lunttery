Rails.application.routes.draw do
	resources :dinners 

	namespace :api do
  		resources :dinners
	end
	
	root :to => 'dinners#index'
end
