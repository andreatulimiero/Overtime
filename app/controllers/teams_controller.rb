class TeamsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def new
        @team = Team.new
    end

    def edit
        @team = Team.find(params[:id])
    end

    def index
        @teams = Team.all
    end

    def show
        @team = Team.find(params[:id])
    end

    def create
        if current_user.admin?
            @team = Team.new teams_params
            if @team.save
                redirect_to @team
            else
                render 'new'
            end
        else
            redirect_to root_path
        end
    end

    def update
        if current_user.admin?
            @team = Team.find(params[:id])
            @team.update(teams_params)
          
            redirect_to @team
        else
          redirect_to root_path
        end
    end
    
    def destroy
        if current_user.admin?
            @team = Team.find params[:id]
            @team.destroy

            redirect_to teams_path
        else
            redirect_to root_path
        end
    end

    private 
        def teams_params
            params.require(:team).permit(:name, :city)
        end
end
