Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users, only: [:create]
  get 'signup', to: 'users#new', as: :signup
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
