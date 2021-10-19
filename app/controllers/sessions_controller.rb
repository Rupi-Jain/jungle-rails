class SessionsController < ApplicationController
  
 
  def new
  end
  
  def create
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    if user = User.authenticate_with_credentials(params[:email].strip, params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      p user
      redirect_to '/login'
    end    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

