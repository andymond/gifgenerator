class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Account Successfully Created."
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Couldn't Create Account"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def logged_in?
      unless current_user
        raise ActionController::RoutingError.new('Not Found')
      end
    end

end
