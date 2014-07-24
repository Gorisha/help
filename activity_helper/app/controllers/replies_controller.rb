class RepliesController < ApplicationController
  def new
  end

  def create
  	# raise Message.find(params[:message_id]).sender_id.to_yaml
  	@msg= Message.find(params[:message_id])
  	@last_reply= @msg.replies.last
  	
  	@reply = Reply.new(reply_params)
    @reply.message_id = params[:message_id]
    if(@last_reply.present?)
    	puts "-------------------------inside last reply------------------"
  	
		if( current_user.id != @last_reply.sender_id )
		    # @reply.sender = current_user
		    # @reply.receiver_id = Message.find(params[:message_id]).sender_id
		    @reply.sender_id= @last_reply.receiver_id
		    @reply.receiver_id=@last_reply.sender_id
		    
	 else
			@reply.sender_id= @last_reply.sender_id
		    @reply.receiver_id=@last_reply.receiver_id
		    # raise @reply.to_yaml
	 end
	 else
	      if(current_user.id == @msg.sender_id)
	           @reply.sender_id = current_user.id
	           @reply.receiver_id = @msg.receiver_id
	       else
	           @reply.sender_id = @msg.receiver_id
	           @reply.receiver_id = @msg.sender_id
          end
    end
    @reply.save  
    redirect_to messages_path(id:@reply.message_id)
  end

  def index
  end
  def reply_params
      params.require(:reply).permit(:text)
    end
end
