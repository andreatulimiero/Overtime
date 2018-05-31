class PlaybooksController < ApplicationController
    before_action :authenticate_user!

    def new
        @playbook = Playbook.new
    end

    def edit
        @playbook = Playbook.find(params[:id])
    end

    def index
        @playbooks = Playbook.all
    end

    def show
        @playbook = Playbook.find params[:id]
    end

    def create
        if current_user.admin?
            @playbook = Playbook.new playooks_params
            if @playbook.save
                redirect_to @playbook
            else
                render 'new'
            end
        else
            redirect_to root_path
        end
    end

    def update
        if current_user.admin?
            @playbook = Playbook.find(params[:id])
            @playbook.update(articles_params)
          
            redirect_to @playbook
        else
          redirect_to root_path
        end
    end

    def destroy
        if current_user.admin?
            @playbook = Playbook.find(params[:id])
            @playbook.destroy
 
            redirect_to playbooks_path
        else
            redirect_to root_path
        end
    end

    private 
        def playbooks_params
            params.require(:playbook).permit(:title, :body)
        end
end

end
