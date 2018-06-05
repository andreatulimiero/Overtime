class DiscussionsController < ApplicationController
    include DiscussionsHelper
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
        if @discussion.save
            redirect_to discussion_path(@discussion)
        else
            render 'new'
        end
    end

    def update 
        @discussion = Discussion.find(params[:id])
        if can_see_edit_and_delete(@discussion)
            if !@discussion.update(discussions_params)
                redirect_to edit_discussion_path(@discussion)
            else
                redirect_to discussion_path(@discussion)
            end
        else
            redirect_to discussion_path(@discussion)
        end
    end
    
    def destroy
        @discussion = Discussion.find(params[:id])
        if can_see_edit_and_delete(@discussion)
            # TODO: Consider whether showing or not "forbidden" status
            @discussion.destroy
        end

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

    def star
        @discussion = Discussion.find(params[:id])

        discussion_star = DiscussionStar.find_by(:discussion => @discussion, :user => current_user)
        if !discussion_star.nil?
            discussion_star.destroy
            redirect_to discussion_path(@discussion)
            return
        end

        discussion_star = DiscussionStar.new(:discussion => @discussion, :user => current_user)
        discussion_star.save
        redirect_to discussion_path(@discussion)
    end

    def total_votes
        @discussion = Discussion.find(params[:id])
        @discussion.discussion_upvotes.count - @discussion.discussion_downvotes.count
    end

    private
        def discussions_params
            params.require("discussion").permit(:title, :body)
        end
end
