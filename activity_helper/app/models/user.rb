class User < ActiveRecord::Base
	has_many :activities
	has_many :comments
	has_many :messages_sent , class_name: 'Message' , foreign_key: 'sender_id'
	has_many :messages_received , class_name: 'Message' , foreign_key: 'receiver_id'
	has_many :replies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def self.from_omniauth(auth)
         	user = self.where(email:auth.info.email).first
         	if user
         		return user
         	else
         		user = User.new
         		user.email = auth.info.email
		    	user.password = Devise.friendly_token[0,20]
		    	user.save
		    	return user
         	end
		  # where(auth.slice(:provider, :uid)).first_or_create do |user|
		  #   user.email = auth.info.email
		  #   user.password = Devise.friendly_token[0,20]
		  # end
         end
end
