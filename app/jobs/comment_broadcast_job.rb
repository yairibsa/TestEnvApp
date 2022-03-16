class CommentBroadcastJob < ApplicationJob
queue_as :default

def perfom(comment)
    ActionCable.server.broadcast "guides_#{comment.guide.id}_channel", comment: render_comment(comment)
end

private

def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
end

end