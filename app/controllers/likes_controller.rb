class LikesController < ApplicationController

	def create
		Activity.find(params[:activity_id]).likes.create(user_id: session[:user_id])
		redirect_to :back
	end

	def destroy
		@like = Like.where(user_id: session[:user_id], activity_id: params[:activity_id])
		@like[0].destroy
		redirect_to :back
	end	

end
