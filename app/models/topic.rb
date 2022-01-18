class Topic < ApplicationRecord
    validates_presence_of :title
    
    has_many :guides
end
