# Модель пользователя
class User < ApplicationRecord
  # Пользователь может создавать много событий
  has_many :events

  # У пользователя не должно быть имя длиннее 35 букв
  validates :name, presence: true, length: {maximum: 35}

  # У пользователя должен быть уникальный email по заданному шаблону не длиннее 255
  # символов
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
end
