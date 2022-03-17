class GuidesChannel < ApplicationCable::Channel

    def subscribed
        stream_from "guides_#{params['guide_id']}_channel"
    end
    
    def unsubscribed
        
    end
    
    def send_comment(data)
        current_user.comments.create!(content: data['comment'], guide_id: data['guide_id'])
    end
end