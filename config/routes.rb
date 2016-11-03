Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	resources :dinners 
	resources :meals 
	namespace :api do
  		resources :dinners
	end
	
	

	root :to => 'dinners#index'
end
