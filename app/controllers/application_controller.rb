class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :authenticate_user, {only:[:logout]}
  before_action :confirm_logout, {only:[:signup,:login]}

  private
  def authenticate_user
    if current_user.nil?
      redirect_to("/")
      flash[:notice] = "Please login"
    end
  end
  
  def confirm_logout
    if current_user
      redirect_to("/")
      flash[:notice] = "Please logout"
    end
  end
  
  def method_out_of_service
    flash[:notice] = "I'm sorry...this service has been limited now"
    redirect_to("/")
  end
  
end


