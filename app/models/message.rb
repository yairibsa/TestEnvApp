class Message < ApplicationRecord
    #has_many :users
    #accepts_nested_attributes_for :users, 
     #                             reject_if: lambda { |attrs| attrs['name'].blank? }

    validates_presence_of :body, :active

end
