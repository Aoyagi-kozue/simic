Rails.application.routes.draw do


  post '/rate' => 'rater#create', :as => 'rate'
  resources :evaluations
  resources :fav_reviews

	devise_for :users

	resources :users do
		resource :mylists
		resource :reads
    resource :recommends
	end

	resources :comics do
    resource :reviews, only: [:create, :new]

    collection do
    	get 'search', to: 'comics#search'
    end
  end

  get 'withdraw', to: 'users#withdraw'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
