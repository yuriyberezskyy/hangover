class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]


  def new
    if session[:user_id]
      redirect_to @current_user
    end
  end

  def create
    # find the user with their email
    user = User.find_by(email: params[:session][:email])
    # compare the password to something in the database
    if user && user.authenticate(params[:session][:password])
      # if the password is correct, save user_id to session
      session[:user_id] = user.id
      if user.businesses.empty?
      redirect_to area_path
      else
      redirect_to user
      end
    else
      flash[:errors] = "Could Not Find User. Check Your Email/PW"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end