Rails.application.routes.draw do

  root to: 'categories#index'
  resources :categories, only: [:index, :show]
  resources :recipes do
    resources :ingredients
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  get 'register', to: 'users#new'
  post 'register', to: 'users#create'
end
