class UsersController < ApplicationController
  before_action :already_authenticated_user!, only: %i[new]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
    )
  end
end
