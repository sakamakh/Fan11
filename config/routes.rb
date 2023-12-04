Rails.application.routes.draw do
  root 'requests#index'
  devise_for :users
  resources :requests do
    collection do
      get 'get_match_categories'
    end
  end
end
