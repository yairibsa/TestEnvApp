class Message < ApplicationRecord
    has_many :messages
    accepts_nested_attributes_for :users, 
                                  reject_if: lambda { |attrs| attrs['users_id'].blank? }

        
    validates_presence_of :body, :active

end
