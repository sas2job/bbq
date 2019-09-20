# Модель Подписки
class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  # Обязательно должно быть событие
  validates :event, presence: true

  # Проверки user_name и user_email выполняются,
  # только если user не задан
  # То есть для анонимных пользователей
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  # Для конкретного event_id один юзер может подписаться только один раз (если юзер задан)
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }

  # Или один email может использоваться только один раз (если анонимная подписка)
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validate :user_email_must_be_unique, on: :create, unless: -> { user.present? }

  validate :user_must_not_be_author, on: :create, if: -> { user.present? }

  def user_must_not_be_author
    errors.add(:user_id, I18n.t('errors.self_subscribe')) if user == event.user
  end

  # переопределяем метод, если есть юзер, выдаем его имя,
  # если нет -- дергаем исходный переопределенный метод
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  # переопределяем метод, если есть юзер, выдаем его email,
  # если нет -- дергаем исходный переопределенный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private
  def user_email_must_be_unique
    errors.add(:user_email, I18n.t('errors.user_email')) if User.all.where(email: user_email).any?
  end
end
