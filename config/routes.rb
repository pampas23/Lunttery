Rails.application.routes.draw do
	resources :dinners
	root :to => 'dinners#index'
end
