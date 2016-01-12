class PhotosController < ApplicationController
	
	def create
		User.find(session[:user_id]).photos.create(image_params)
		redirect_to :back
	end

	def destroy
		
	end

	private
	def image_params
		params.require(:photo).permit(:image)
	end
end
