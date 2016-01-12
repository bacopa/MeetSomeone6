class SessionsController < ApplicationController

	def login
		render "login.html.erb"
	end

	def logout
		session.clear
		redirect_to "/"
	end

	def create
		@user = User.find_by_email(login_params[:email])
		if @user && @user.authenticate(login_params[:password])
			session[:user_id] = @user.id
			session[:username] = @user.username
			redirect_to "/activities/main"
		else
			flash[:errors] = "Email or password is incorrect."
			redirect_to :back
		end

	end

	private
	def login_params
		params.require(:user).permit(:email, :password)
	end
end
