Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	
	resources :dinners do
		resources :meals	
	end

	namespace :admin do
		resources :dinners do
			resources :meals do
				resources :user_meal_likeships, :only =>[:edit]
			end	
		end
	end
	
	resources :photos 
	
	namespace :api, :defaults => { :format => :json }  do
  		resources :users,:only =>[:show]
  		resources :dinners
  		resources :meals do
  			resources :user_meal_likeships, :only =>[:edit]	
  		end
  		
	end
	
	

	root :to => 'dinners#index'
end
