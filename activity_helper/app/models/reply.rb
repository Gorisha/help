class Reply < ActiveRecord::Base
 belongs_to :message
 belongs_to :sender , class_name: 'User'
 belongs_to :receiver , class_name: 'User'
end
