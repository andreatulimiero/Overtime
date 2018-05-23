class DiscussionsController < ApplicationController
    def index
        @discussions = Discussion.all

        render plain: @discussions.length
    end

    def show
        @discussion = Discussion.find(params[:id])

        render plain: @discussion
    end

    def create
        @discussion = Discussion.new(discussions_params)
        @discussion.save

        render plain: @discussion
    end

    def destroy
        @discussion = Discussion.find(params[:id])
        @discussion.destroy

        render plain: "Destroyed discussion"
    end
    
    private
        def discussions_params
            params.permit(:title, :body)
        end
end
