class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  layout :layout_by_controller

  protected

  def layout_by_controller
    devise_controller? ? 'devise' : 'application'
  end
end
