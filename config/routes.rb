Rails.application.routes.draw do


  resources :evaluations
  resources :fav_reviews
  resources :reviews
  resources :tags
  resources :comic_tags
  resources :cover_imgs
  resources :genres
  resources :labels
  resources :publishers
  resources :authors
  resources :follows

	devise_for :users

	resources :users do
		resource :mylists
		resource :reads
    resource :recommends
	  member do
	  	get 'withdraw', to: 'users#confirm'
	  end
	end

	resources :comics do
    collection do
    	get 'search', to: 'comics#search'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
