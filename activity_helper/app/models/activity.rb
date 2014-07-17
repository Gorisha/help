class Activity < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	mount_uploader :avatar, AvatarUploader
	# VALID_VIDEO_REGEX = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
	# VALID_VIDEO_REGEX = /^http:\/\/(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:\S+)?$/
 #    validates :video, presence: true,
 #    				  format: { with: VALID_VIDEO_REGEX },
 #    				  uniqueness: { case_sensitive: false}
end
