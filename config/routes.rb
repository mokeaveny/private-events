Rails.application.routes.draw do
	root 'events#index'

	resources :users
	resources :sessions, only: [:create, :new, :destroy]

	get '/signup', to: 'users#new'
	get '/logout', to: 'sessions#destroy'
	get '/login', to: 'sessions#new'

end
