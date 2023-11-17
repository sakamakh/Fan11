Rails.application.routes.draw do
  root 'requests#index'
  devise_for :users
  resources :requests
  get 'requests/get_match_categories'
end
