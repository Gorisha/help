class MessagesController < ApplicationController
  	def new
  		@user= User.find(params[:user_id])
  	end

  	def create
  		# ===============Method 1======================
  		# @msg = Message.new(msg_params)
    	# @msg.sender = current_user
    	# @msg.receiver_id = params[:user_id]
    	# =============================================
    	# ===============Method 2======================
  		# @msg = current_user.messages_sent.new(msg_params)
    	# @msg.receiver_id = params[:user_id]
    	# ============================================
    	# ==============Method 3======================
    		@receiver = User.find(params[:user_id])
    		@msg = @receiver.messages_received.new(msg_params)
    		@msg.sender = current_user
    	# ============================================
      	@msg.save  
      	redirect_to root_path 
   end

   def messages
   	
   end

   private
       def msg_params
        params.require(:message).permit(:body)
      end
end
