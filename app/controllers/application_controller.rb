class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_user_signing

  def check_user_signing
  	unless session[:user_id].present?
  		redirect_to root_path, error: 'Please sign in using twitter.'
  	end
  end

  def current_user
  	session[:user_id].present? ? User.find(session[:user_id]) : nil
  end
end
