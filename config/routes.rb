Rails.application.routes.draw do
  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users
  # корень сайта
  root "events#index"

  resources :events

  # Поддерживаются только: show, edit, update
  resources :users, only: [:show, :edit, :update]
end
