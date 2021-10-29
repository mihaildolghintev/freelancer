class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard; end

  def update
    @user = current_user
    flash[:notice] = if @user.update(current_user_params)
                       'Saved...'
                     else
                       'Cannot update...'
                     end
    redirect_to dashboard_path
  end

  private

  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language)
  end
end
