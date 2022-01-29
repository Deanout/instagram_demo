class ApplicationController < ActionController::Base
  before_action :set_notifications

  def set_notifications
    @unread_notifications = current_user.notifications.unread.newest_first if current_user
    @read_notifications = current_user.notifications.read.newest_first if current_user
  end
end
