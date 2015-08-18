class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def home
  if user_signed_in?
    redirect_to :controller=>'static_pages', :action => 'home'
  end
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
