class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard; end

  def update
    @user = current_user
    flash[:notice] =
      @user.update(current_user_params) ? 'Saved...' : 'Cannot update...'
    redirect_to dashboard_path
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language, :avatar)
  end
end
