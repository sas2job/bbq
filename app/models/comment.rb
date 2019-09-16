# Модель Комментария
class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # Не может быть комментария без события
  validates  :event, presence: true

  # Пустой комментарий тоже недопустим
  validates :body, presence: true

  # Это поле должно быть, только если не выполняется user.present? (у объекта на задан юзер)
  validates :user_name, presence: true, unless: -> { user.present? }

  # переопределяем метод, если есть юзер, выдаем его имя,
  # если нет -- дергаем исходный переопределенный метод
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end
end
