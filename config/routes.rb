Rails.application.routes.draw do
  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users
  # корень сайта
  root "events#index"

  resources :events do
    # вложенный ресурс комментов
    resources :comments, only: [:create, :destroy]
  end

  # Поддерживаются только: show, edit, update
  resources :users, only: [:show, :edit, :update]
end
