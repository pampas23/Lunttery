Rails.application.routes.draw do
  devise_for :users
	resources :dinners 
	resources :meals 
	namespace :api do
  		resources :dinners
	end
	
	root :to => 'dinners#index'
end
