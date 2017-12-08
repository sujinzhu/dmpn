class PasswordController < ApplicationController
  before_action :require_user
  layout 'signin'

  def index
    @user = current_user
  end

  def change
    @user = current_user
    # @user.password = params[:user][:password]
    # @user.password_confirmation = params[:user][:password_confirmation]
    if @user.update(params.require(:user).permit(:password, :password_confirmation))
      redirect_to root_url, notice: 'Password changed!'
    else
      render :index
    end
  end
end
