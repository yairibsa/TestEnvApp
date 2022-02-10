class Message < ApplicationRecord
	belongs_to :user
	validates_presence_of :body, :active
	
 def self.user
       where(user_id: '1')
 end
	
end
