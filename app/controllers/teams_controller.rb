class TeamsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @teams = Team.all
        render plain:@teams.length
    end

    def show
        @team = Team.find(params[:id])

        render plain: @team.name + @team.city
    end

    def create
        @team = Team.new team_params
        if @team.save
            redirect_to @team
          else
            render 'new'
          end
        
        render plain: @team.name + @team.city
    end

    def destroy
        @discussion = Team.find params[:id]
        @team.destroy

        render plain: 'Team destroyed'
    end

    private 
        def team_params
            params.require(:team).permit(:name, :city)
        end
end
