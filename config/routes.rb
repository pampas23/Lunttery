Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	
	resources :dinners do
		resources :meals	
	end

	namespace :admin do
		resources :users
		resources :meals
		resources :dinners do
			resources :meals do
				resources :user_meal_likeships, :only =>[:edit]
			end
		end
	end
	
	resources :photos 
	
	namespace :api, :defaults => { :format => :json }  do
  		resources :users,:only =>[:show]
  		resources :dinners do
  			resources :coupon_tracks, :only =>[:edit]	
  		end
  		resources :meals do
  			resources :user_meal_likeships, :only =>[:edit]	
  		end
  get "login" => "auth#login"
  get "logout" => "auth#logout"		

	end

	root :to => 'dinners#index'
end
