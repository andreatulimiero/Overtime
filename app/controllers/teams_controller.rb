class TeamsController < ApplicationController
    def index
        @teams = Team.all
        render plain:@teams.length
    end
    def show
        @team = Team.find params[:id]

        render plain: @team.name + @team.city
    end

    def create
        @team = Team.new team_params
        @team.save

        render plain: @team.name + @team.city
    end

    def destroy
        @discussion = Team.find params[:id]
        @team.destroy

        render plain: 'Team destroyed'
    end

    private 
        def team_params
            params.permit :name, :city
        end
end
