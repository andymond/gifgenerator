Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:create, :show]
  resources :sessions, only: [:new, :create]
  delete "/logout", to: 'sessions#destroy', as: 'logout'
  resources :gifs, only: [:create, :index]
end
