class DiscussionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @discussions = Discussion.all

        render plain: @discussions.length
    end

    def show
        @discussion = Discussion.find(params[:id])

        render plain: @discussion.title + @discussion.body
    end

    def create
        @discussion = Discussion.new(discussions_params)
        @discussion.save

        render plain: @discussion.title + @discussion.body
    end

    def update 
        @discussion = Discussion.find(params[:id])
        @discussion.update(discussions_params)

        render plain: @discussion.title + @discussion.body
    end
    
    def destroy
        @discussion = Discussion.find(params[:id])
        @discussion.destroy

        render plain: "Discussion destroyed"
    end

    private
        def discussions_params
            params.permit(:title, :body)
        end
end
