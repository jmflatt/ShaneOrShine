Rails.application.routes.draw do
  resources :weather, only: :index

  root to: 'weather#index'
end
