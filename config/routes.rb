Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :users

  resources :articles, only: %i[index new create show] do
    resources :votes, only: [:create, :destroy]
  end
end
