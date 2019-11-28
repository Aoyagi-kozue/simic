Rails.application.routes.draw do

  root to: 'comics#index', as: 'root'

	devise_for :users

	resources :users
  get 'withdraw', to: 'users#withdraw'
  get 'about', to: 'users#about'

	resources :comics do
    resource :reviews, only: [:create, :new]
    collection do
    	get 'search', to: 'comics#search'
    end
  end

  post '/rate' => 'rater#create', :as => 'rate'
  get 'tags/:tag', to: 'comics#tag_index', as: :tag

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
