class ApplicationController < ActionController::Base
  protect_from_forgery
  include ControllerAuthentication

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/ && !(request.user_agent =~ /iPad/)
  end
  helper_method :mobile_device?

end
