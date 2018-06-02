class CommentsController < ApplicationController
    include CommentsHelper
    before_action :authenticate_user!

    def create
        @discussion = Discussion.find(params[:discussion_id])
        @comment = @discussion.comments.create(comment_params)
        @comment.user = current_user
        @comment.save

        redirect_to discussion_path(@discussion)
    end

    def destroy
        @discussion = Discussion.find(params[:discussion_id])
        @comment = Comment.find(params[:id])
        if can_see_edit_and_delete(@comment)
            # TODO: Consider whether showing or not "forbidden" status
            not_found
        end
        @comment.destroy

        redirect_to discussion_path(@discussion)
    end    

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end
