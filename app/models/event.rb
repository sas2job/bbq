# Модель событие
class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  # У события много комментариев
  has_many :comments, dependent: :destroy
  # У события много подписок
  has_many :subscriptions, dependent: :destroy

  # Валидируем заголовок, он не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}
  # У события должны быть заполнены место и время
  validates :address, presence: true
  validates :datetime, presence: true
end
