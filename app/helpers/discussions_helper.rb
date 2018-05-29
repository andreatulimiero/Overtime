module DiscussionsHelper
    def total_votes
        @discussion = Discussion.find(params[:id])
        @discussion.discussion_upvotes.count - @discussion.discussion_downvotes.count
    end  
end
