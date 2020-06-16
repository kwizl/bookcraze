Rails.application.routes.draw do
  get 'categories/index'
  resources :sessions, only: %i[new create destroy]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :users
  
  resources :articles, only: %i[index new create show] do
    resources :votes, only: [:create, :destroy]
  end

  resources :categories, only: %i[show]
end
