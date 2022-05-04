class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.create(comment_params)
        redirect_to guides_path
        #respond_to do |format|
            #if @comment.save(comment_params)
             #   redirect_to guide_path(@guides)
                
            #else
             #   redirect_to(guides_path)
        
            #end
        #end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:content, :guide_id)
        #params [:guide_id]="@guide.id"
    end
    
end
