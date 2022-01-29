class ApplicationController < ActionController::Base
  before_action :set_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_notifications
    @unread_notifications = current_user.notifications.unread.newest_first if current_user
    @read_notifications = current_user.notifications.read.newest_first if current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar username])
  end
end
