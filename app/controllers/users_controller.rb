class UsersController < ApplicationController
  before_action :forbid_access_user, { only: [:edit, :edit_user_image] }
  before_action :confirm_logout, { only: [:new, :create] }
  before_action :method_out_of_service, { only: [:create] }

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
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.user_image_name
      new_user_image_name = @user.user_image_name
    else
      new_user_image_name = "#{rand.to_s[2..8]}.jpg"
    end
    if params[:user_image]
      @user.update_attribute(:user_image_name, new_user_image_name)
      @user.update_attribute(:user_image, params[:user_image])
      redirect_to("/user/#{session[:user_id]}")
      flash[:notice] = "Change your image!"
    else
      flash.now[:notice] = "Failed"
      render("/user/edit")
    end
  end


  private
  def user_params
    params.fetch(:user, {}).permit(:name, :email, :email_confirmation,
    :password,:password_confirmation)
  end

end
