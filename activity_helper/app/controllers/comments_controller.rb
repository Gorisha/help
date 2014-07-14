class CommentsController < ApplicationController

	def create
        @user= User.find(params[:user_id])
		@activity= Activity.find(params[:activity_id])
		@comment = @activity.comments.new(comment_params)
		@comment.user_id = @user.id
		@comment.save
		redirect_to root_path
	end

	def new
		 # @comment= Comments.find(params[:id])
		 @user= User.find(params[:user_id])
		 @activity= Activity.find(params[:activity_id])
	end

	def comment_params
         params.require(:comment).permit(:body)
    end

end