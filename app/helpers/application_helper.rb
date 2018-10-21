module ApplicationHelper

  def method_out_of_service
    flash[:notice] = "I'm sorry, this service has been limited now"
    redirect_to("/")
  end

end
