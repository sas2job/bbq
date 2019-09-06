Rails.application.routes.draw do
  # корень сайта
  root "events#index"

  resources :events
  resources :users, only: [:show, :edit, :update]
end
