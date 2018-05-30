module DiscussionsHelper
    def can_see_edit_and_delete(discussion)
        p discussion
        if current_user.nil?
            return false
        end
        discussion.user == current_user or current_user.admin
    end

    def total_votes
        @discussion = Discussion.find(params[:id])
        @discussion.discussion_upvotes.count - @discussion.discussion_downvotes.count
    end
end
