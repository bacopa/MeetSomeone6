class ActivitiesController < ApplicationController

	def main
		@activities = Activity.all
		render "main.html.erb"
	end

	def new
		@activity = Activity.new
		render "new.html.erb"
	end

	def show
		@activity = Activity.find(params[:activity_id])
		

		@women_seeking_men = @activity.ppl.where(gender:'woman', seeking:'men')
		@women_seeking_women = @activity.ppl.where(gender:'woman', seeking:'women')
		@men_seeking_women = @activity.ppl.where(gender:'man', seeking:'women')
		@men_seeking_men = @activity.ppl.where(gender:'man', seeking:'men')

		@user = User.find(session[:user_id])
		@activities_created = @user.activities.ids
		@liked = @user.liked.ids

		if @user.gender == 'man' && @user.seeking == 'women'
			@default = @women_seeking_men
		elsif @user.gender == 'man' && @user.seeking == 'men'
			@default = @men_seeking_men
		elsif @user.gender == 'woman' && @user.seeking == 'women'
			@default = @women_seeking_women
		else @user.gender == 'woman' && @user.seeking == 'men' 
			@default = @men_seeking_women
		end
		render "show.html.erb"
	end

	def create
		@activity = Activity.create(activity_params)
		flash[:errors] = @activity.errors.full_messages
		if flash[:errors].length > 0
			redirect_to :back
		else
			flash[:success] = "Activity successfully added!"
			redirect_to :back
		end
		
	end

	def edit
		@activity = Activity.find(params[:activity_id])
		session[:activity_id] = @activity.id
		render "edit.html.erb"
	end

	def update
		Activity.find(session[:activity_id]).update(activity_params) 
		redirect_to :back
	end

	private
	def activity_params
		params.require(:activity).permit(:name, :location, :description, :image, :user_id)
	end
end
