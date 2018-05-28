class DiscussionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def new
        @discussion = Discussion.new
    end

    def index
        @discussions = Discussion.all
    end

    def show
        @discussion = Discussion.find(params[:id])
        # This is needed in order to create the form for the comment
        @comment = Comment.new
        @comments = @discussion.comments
    end

    def edit
        @discussion = Discussion.find(params[:id])
    end

    def create
        @discussion = Discussion.new(discussions_params)
        @discussion.user = current_user
        @discussion.save

        redirect_to discussion_path(@discussion)
    end

    def update 
        @discussion = Discussion.find(params[:id])
        @discussion.update(discussions_params)

        redirect_to discussion_path(@discussion)
    end
    
    def destroy
        @discussion = Discussion.find(params[:id])
        @discussion.destroy

        redirect_to discussions_path
    end

    def upvote
        @discussion = Discussion.find(params[:id])

        if DiscussionUpvote.find(:discussion => @discussion, :user => current_user)
            redirect_to discussion_show(@discussion)
        else
            
        end
    end

    def downvote
        @discussion = Discussion.find(params[:id])
    end

    private
        def discussions_params
            params.require("discussion").permit(:title, :body)
        end
end
