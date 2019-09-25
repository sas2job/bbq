# Модель пользователя
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Добавляем к юзеру функции Девайза, перечисляем конкретные наборы функций
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Пользователь может создавать много событий
  has_many :events

  # У пользователя много комментариев
  has_many :comments, dependent: :destroy

  # У пользователя много подписок
  has_many :subscriptions, dependent: :destroy

  # У пользователя не должно быть имя длиннее 35 букв
  validates :name, presence: true, length: {maximum: 35}

  # У пользователя должен быть уникальный email по заданному шаблону не длиннее 255
  # символов
  validates :email, presence: true, length: {maximum: 255}
  # validates :email, uniqueness: true
  # validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  # При создании нового юзера (create), перед валидацией объекта выполнить
  # метод set_name
  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  # Задаем юзеру случайное имя, если оно пустое
  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end
end
