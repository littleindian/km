class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:id] = user.uid
    redirect_to root_url, notice: "Signed in!"
  end
  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end