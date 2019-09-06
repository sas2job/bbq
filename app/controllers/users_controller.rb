# Контроллер, управляющий пользователями
class UsersController < ApplicationController
  # Задаем объект @user для тех действий, где он нужен
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    # Пропишем, что разрешено передавать в params
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
