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

    private
        def discussions_params
            params.require("discussion").permit(:title, :body)
        end
end
