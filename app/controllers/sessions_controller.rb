class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}."
      redirect_to user_path(user)
    else
      flash[:notice] = "Couldn't log in"
      redirect_to root_path
    end
  end

  def destroy
    flash[:notice] = "Logged out! Smell ya later, #{current_user.name}"
    session.clear
    redirect_to root_path
  end

end
