class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.not_admins
  end

  def show
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thanks for signing up!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Account successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to users_url, status: :see_other,
      alert: "Account successfully deleted!"
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :email, :username, :password, :password_confirmation)
  end

  def require_correct_user
    set_user
    unless current_user?(@user)
      redirect_to movies_path, status: :see_other,
        alert: "You can only edit your own account."
    end
  end

  def set_user
    @user = User.find_by!(slug: params[:id])
  end
end
