class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  after_action :flash_to_headers

  private
    def method_out_of_service
      flash[:notice] = "I'm sorry, this service has been limited now"
      redirect_to("/")
    end
  
    def flash_to_headers
      if request.xhr?
        response.headers["X-Message"] = flash_message
        response.headers["X-Message-Type"] = flash_type.to_s
        flash.discard
      end
    end
    
    def flash_message
      [:error, :warning, :notice].each do |type|
        return flash[type] unless flash[type].blank?
      end
    end
    
    def flash_type
      [:error, :warning, :notice].each do |type|
        return type unless flash[type].blank?
      end
    end
end