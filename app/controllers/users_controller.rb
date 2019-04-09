class UsersController < ApplicationController
  before_action :confirm_login, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :confirm_logout, only: [:new, :create]
  before_action :method_out_of_service, only: [:update] 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      reset_session
      log_in(@user)
      redirect_to("/posts")
      flash[:notice] = "Welcome, #{current_user.name}!"
    else
      flash.now[:notice] = "I'm sorry there seems to be something wrong"
      render("/users/new")
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
  end

  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "Change your image!"
    else
      flash.now[:notice] = "Failed"
      render("/users/edit")
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation, :user_image)
  end
  
end
