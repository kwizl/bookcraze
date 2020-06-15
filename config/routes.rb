Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  resources :users

  resources :articles, only: %i[index new create show] do
    resources :votes, only: [:create, :destroy]
  end
end
