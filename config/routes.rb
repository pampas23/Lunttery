Rails.application.routes.draw do
  devise_for :users
	resources :dinners 

	namespace :api do
  		resources :dinners
	end
	
	root :to => 'dinners#index'
end
