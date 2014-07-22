class HomeController < ApplicationController
  def index
  	@user= current_user
  	# @activities = Activity.all.order("created_at desc")
  	# @activities =  Activity.find(:all, :order => "attending DESC")
  	 @activities = Activity.order(created_at: :desc) 
  	 # @activity.latitude = Activity.params[:activity][:latitude]
  	 # @activity.longitude = Activity.params[:activity][:longitude]

  	 # .group_by {|activity| activity.created_at.to_date}
     # @activity= Activity.find(params[:activity_id])
     # @user= User.find(params[:user_id])
  end
  def new
    if user_signed_in?
       @user= User.find(params[:user_id])
      else
         redirect_to root_path
    end
  end

end
