class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email_or_username]) || 
      User.find_by(username: params[:email_or_username])

    if @user && @user.authenticate(params[:password])
      redirect_to user_path(@user), notice: "Welcome back, #{@user.name}!"
    else
      flash.now[:alert] = "Email / Password did not match."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end
