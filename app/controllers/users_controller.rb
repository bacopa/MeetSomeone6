class UsersController < ApplicationController

	def new
		@user = User.new
		render "join.html.erb"
	end

	def create
		@user = User.create(user_params)
		flash[:errors] = @user.errors.full_messages
		if flash[:errors].length > 0
			redirect_to :back
		else
			session[:user_id] = @user.id
			session[:username] = @user.username
			redirect_to "/activities/main"
		end

	end

	def show
		@user = User.find(params[:user_id])
		@photos = Photo.where(user_id: params[:user_id])
		@message = Message.new
		render "profile.html.erb"
	end

	def edit
		@user = User.find(session[:user_id])
		@photos = @user.photos
		@photo = Photo.new
		render "edit.html.erb"
	end

	def update
		User.find(session[:user_id]).update(user_params)
		redirect_to :back
	end

	private
	def user_params
		params.require(:user).permit(:email, :username, :age, :password, :password_confirmation, :seeking, :gender, :image)
	end

end
