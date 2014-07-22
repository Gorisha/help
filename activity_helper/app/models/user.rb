class User < ActiveRecord::Base
	has_many :activities
	has_many :comments
	has_many :messages_sent , class_name: 'Message' , foreign_key: 'sender_id'
	has_many :messages_received , class_name: 'Message' , foreign_key: 'receiver_id'
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
