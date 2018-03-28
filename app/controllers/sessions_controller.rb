class SessionsController < ApplicationController
  def new
  end

  def create
    #Find the current users
    user = User.find_by(email: params[:session][:email].downcase)
    #Check if that user exists and is authenticated
    if user && user.authenticate(params[:session][:password])
      #Log in the user
      session[:user_id] = user.id;

      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
