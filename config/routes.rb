Rails.application.routes.draw do

  get 'users/confirm'

	devise_for :users

	resources :users do
	  member do
	  	get 'withdraw', to: 'users#confirm'
	  end
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
