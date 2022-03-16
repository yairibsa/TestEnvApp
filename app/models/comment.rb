class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :guide
  
  validates :content, presence: true, length: { minimum: 5, maximimum: 100}
end
