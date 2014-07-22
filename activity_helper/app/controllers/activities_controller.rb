class ActivitiesController < ApplicationController

	respond_to :html, :json, :js

	before_filter :authenticate_user!
	

	def new
		@user= User.find(params[:user_id])
		unless @user == current_user
			redirect_to root_path
			flash[:error] = "Invalid User"
		end
	end

	def edit
		@activity= current_user.activities.find(params[:id])
 	end


 	def update
 		@activity = current_user.activities.find(params[:id])
        if @activity.update_attributes(article_params)
        	respond_with do |format|
        		format.js do
        			render json: true
        		end
        		format.html do
        			redirect_to root_path
        		end
        	end	
        else
    		render 'edit'
	   end
	end   

	def create
		@user=User.find(params[:user_id])
		@activity = @user.activities.new(article_params)
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
