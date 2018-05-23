class DiscussionsController < ApplicationController
    def create
    end

    private
        def discussions_params
            params.require(:discussion).permit(:title, :body)
        end
end
