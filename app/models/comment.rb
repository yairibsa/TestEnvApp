class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :guide
  
  validates :content, presence: true, length: { minimum: 5, maximimum: 100}
  
  after_create_commit { CommentBroadcastJob.perfom_later(self) }
end
