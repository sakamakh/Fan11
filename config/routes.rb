Rails.application.routes.draw do
  root 'requests#index'
  devise_for :users
  resources :requests
end
