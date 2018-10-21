class SessionsController < ApplicationController
  # before_action :method_out_of_service, {only:[:create]}
  before_action :confirm_logout, { only: [:new, :create] }

  def new
    flash.now[:notice] = "Welcome, Login"
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to posts_path
      flash[:notice] = "Login successfully"
    else
      flash.now[:notice] = "Invalid name/password combination"
      render "new"
    end

  end
  
  def destroy
    if logged_in?
      forget current_user
      reset_session
      @current_user = nil
      flash[:notice] = "Logout successfully"
    else
      flash[:notice] = "Already Logouted "
    end
    redirect_to("/")
  end
  
end
