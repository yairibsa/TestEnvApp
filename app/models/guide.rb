class Guide < ApplicationRecord
    enum status: { draft: 0, published: 1}
    extend FriendlyId
    friendly_id:title, use: :slugged
    
    validates_presence_of :title
    
    belongs_to :topic
    
    def self.special_guides
        all
    end
    
    def self.featured_guides
        limit(2)
    end
end
