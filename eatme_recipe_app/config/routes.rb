Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#show', page: 'home'
  get '/recipes/user', to: 'recipes#my_recipes'
  resources :recipes do
    resources :ingredients, shallow: true
    resources :directions, shallow: true
    resources :comments, shallow: true
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'

end
