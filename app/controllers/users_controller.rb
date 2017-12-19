class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit; end

  def update
    unless params[:password]&.empty?
      if current_user.update_attributes(user_params)
        redirect_to root_path
      else
        redirect_to edit_user_path
      end
    else
      if current_user.update_without_password(user_params)
        redirect_to root_path
      else
        redirect_to edit_user_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :you_do, :password, :password_confirmation)
  end
end
