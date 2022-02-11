class Message < ApplicationRecord
	belongs_to :user
	validates_presence_of :body, :active
	
 def self.user1
       where(user_id: '1')
 end
	
 def self.user2
 		where(user_id: '2')
 end
end
