class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    # render :new
    
  end

  def create
    user_params = params.require(:user).permit(:email, :password, :full_name)
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user.id

      # response/redirect?
      redirect_to businesses_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to signup_path
    end

  end

   def show
    @businesses = @current_user.businesses
   end
end