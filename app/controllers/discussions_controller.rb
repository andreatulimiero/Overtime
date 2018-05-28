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

        # If there's already an upvote remove it
        upvote = DiscussionUpvote.find_by(:discussion => @discussion, :user => current_user)
        if !upvote.nil?
            upvote.destroy
            redirect_to discussion_path(@discussion)
            return
        end

        # If there's already a downvote remove it
        downvote = DiscussionDownvote.find_by(:discussion => @discussion, :user => current_user)
        if !downvote.nil?
            downvote.destroy                        
        end
        upvote = DiscussionUpvote.new(:discussion => @discussion, :user => current_user)
        upvote.save
        redirect_to discussion_path(@discussion)
    end

    def downvote
        @discussion = Discussion.find(params[:id])

        # If there's already a downvote remove it
        downvote = DiscussionDownvote.find_by(:discussion => @discussion, :user => current_user)
        if !downvote.nil?
            downvote.destroy
            redirect_to discussion_path(@discussion)
            return
        end

        # If there's already a downvote remove it
        upvote = DiscussionUpvote.find_by(:discussion => @discussion, :user => current_user)
        if !upvote.nil?
            upvote.destroy                        
        end
        downvote = DiscussionDownvote.new(:discussion => @discussion, :user => current_user)
        downvote.save
        redirect_to discussion_path(@discussion)
    end

    private
        def discussions_params
            params.require("discussion").permit(:title, :body)
        end
end
