Rails.application.routes.draw do


  resources :evaluations
  resources :fav_reviews
  resources :tags
  resources :comic_tags
  resources :publishers
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
    resource :reviews, only: [:create]

    collection do
    	get 'search', to: 'comics#search'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
