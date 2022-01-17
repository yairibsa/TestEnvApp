class Guide < ApplicationRecord
    enum status: { draft: 0, published: 1}
    extend FriendlyId
    friendly_id:title, use: :slugged
    
    validates_presence_of :title
    
    belongs_to :topic
end
