class MessagesController < ApplicationController

	def create
		User.find(session[:user_id]).messages.create(msg_params)
		redirect_to :back
	end

	def destroy
		redirect_to :back
	end

	def Update
		#update column "seen" from false to true, so users know if they have new messages
	end

	def show
		@sent = User.find(session[:user_id]).messages
		@received = Message.where(recipient: session[:user_id])
		render "show.html.erb"
	end

	private
	def msg_params
		params.require(:message).permit(:content, :recipient, :username, :recusername)
	end
end
