class ActivitiesController < ApplicationController
	before_filter :authenticate_user!

	def new
		@user= User.find(params[:user_id])
		unless @user == current_user
			redirect_to root_path
			flash[:error] = "Invalid User"
		end
	end

	def edit
		@activity= Activity.find(params[:id])
 	end

 	def update
 		@activity = Activity.find(params[:id])
 
       if @activity.update(article_params)
        redirect_to root_path
         else
    		render 'edit'
	   end
	end   

	def create
		@activity = Activity.new(article_params)
		# @activity.latitude = params[:activity][:latitude]
 
        @activity.save
        redirect_to root_path
             # render video
	end
	# def index
	# @activity= Activity.find(:all)
    #  end

	private

    def article_params
    params.require(:activity).permit(:title, :description , :avatar, :video, :address , :latitude , :longitude)
  end
end
