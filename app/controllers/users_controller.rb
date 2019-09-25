# Контроллер, управляющий пользователями
class UsersController < ApplicationController
  # Встроенный в девайз фильтр — посылает незалогиненного пользователя
  before_action :authenticate_user!, except: [:show]

  # Задаем объект @user для шаблонов и экшенов
  before_action :set_current_user, except: [:show]

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('controllers.users.updated')
    else
      render :edit
    end
  end

  private
    def set_current_user
      @user = current_user
    end

    # Пропишем, что разрешено передавать в params
    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end
end
