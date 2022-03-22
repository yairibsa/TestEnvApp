class Topic < ApplicationRecord
    validates_presence_of :title
    
    has_many :guides
    
    def self.with_guides
        includes(:guides).where.not(guides: { id: nil})
    end
end

