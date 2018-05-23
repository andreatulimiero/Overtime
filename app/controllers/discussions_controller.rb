class DiscussionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @discussions = Discussion.all
    end

    def show
        @discussion = Discussion.find(params[:id])
    end

    def create
        @discussion = Discussion.new(discussions_params)
        @discussion.user = current_user
        @discussion.save
    end

    def update 
        @discussion = Discussion.find(params[:id])
        @discussion.update(discussions_params)
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
