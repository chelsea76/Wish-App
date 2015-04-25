module ApplicationHelper
	def current_user
  	session[:user_id].present? ? User.find(session[:user_id]) : nil
  end
end
