class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def home
    redirect_to controller: 'static_pages', action: 'home' if user_signed_in?
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
