Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	
	resources :dinners do
		resources :meals	
	end

	namespace :admin do
		resources :dinners do
			resources :meals	
		end
	end
	
	resources :photos 
	
	namespace :api do
  		resources :dinners
	end
	
	

	root :to => 'dinners#index'
end
