class SessionsController < ApplicationController
  def create
    @current_user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @current_user.id
    flash[notice] = "Signed in!"
    render "users/show"
  end
  def destroy
    session[:user_id] = nil
    render "users/index"
  end
end