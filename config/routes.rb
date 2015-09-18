Rails.application.routes.draw do


	get '/login', to: 'sessions#new'
	post '/sessions', to: 'sessions#create'
	delete '/sessions', to: 'sessions#destroy'

	resources :users
	resources :posts do
		resources :comments, only:[:create, :destroy]
	end 
	
    root 'posts#index'

end
