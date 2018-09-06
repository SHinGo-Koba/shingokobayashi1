class SessionsController < ApplicationController
  before_action :method_out_of_service, {only:[:create]}

  def new
    
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in(user)
      redirect_to posts_path
      flash[:notice] = "Login successfully"
    else
      flash.now[:notice] = "Invalid name/password combination"
      render "new"
    end

  end
  
  def destroy
    reset_session
    @current_user = nil
    redirect_to("/")
    flash[:notice] = "Logout successfully"

  end
end
