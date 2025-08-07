class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email_or_username]) || 
      User.find_by(username: params[:email_or_username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back, #{@user.name}!"
    else
      flash.now[:alert] = "Email / Password did not match."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_url, status: :see_other, notice: "Successfully logged out."
  end
end
