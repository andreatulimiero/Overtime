module CommentsHelper
    def can_see_edit_and_delete(comment)
        if current_user.nil?
            return false
        end
        comment.user == current_user or current_user.admin
    end
end
