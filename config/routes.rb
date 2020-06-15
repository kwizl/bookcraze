Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :articles, only: %i[index new create show]
end
