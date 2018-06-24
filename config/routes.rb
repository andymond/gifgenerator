Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:create, :show]
  resources :sessions, only: [:new, :create]
end
