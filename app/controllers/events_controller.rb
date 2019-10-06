# Контроллер, управляющий событиями
class EventsController < ApplicationController

  # Встроенный в девайз фильтр — посылает незалогиненного пользователя
  before_action :authenticate_user!, except: [:show, :index]

  # Задаем объект @event для экшена show
  before_action :set_event, only: [:show]

  # Задаем объект @event от текущего юзера для других действий
  before_action :set_current_user_event, only: [:edit, :update, :destroy]

  # Проверка пин-кода перед отображением события
  before_action :password_guard!, only: [:show]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    # Болванка модели для формы добавления фотографии
    @new_photo = @event.photos.build(params[:photo])
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      # Используем сообщение из файла локалей ru.yml
      # controllers -> events -> created
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: I18n.t('controllers.events.destroyed')
  end

  private
    def password_guard!
    # Если у события нет пин-кода, то охранять нечего
    return true if @event.pincode.blank?
    # Пин-код не нужен автору события
    return true if signed_in? && current_user == @event.user

    # Если нам передали код и он верный, сохраняем его в куки этого юзера
    # Так юзеру не нужно будет вводить пин-код каждый раз
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    # Проверяем, верный ли в куках пин-код
    # Если нет — ругаемся и рендерим форму ввода пин-кода
    pincode = cookies.permanent["events_#{@event.id}_pincode"]
    unless @event.pincode_valid?(pincode)
      if params[:pincode].present?
        flash.now[:alert] = I18n.t('controllers.events.wrong_pincode')
      end
      render 'password_form'
    end
  end

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  # Отредактируем параметры события
  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
