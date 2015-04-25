class SessionsController < ApplicationController

  skip_before_action :check_user_signing, only: [:create, :destroy]

  def create
  	#render text: request.env['omniauth.auth'].to_yaml
  	begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
  	reset_session
  	redirect_to root_path, notice: "Successfully sign out."
  end	
end
