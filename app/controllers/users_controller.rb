class UsersController < ApplicationController
        
    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find params[:id]
    end

    def create
        @user = User.new user_params
        if @user.save
            redirect_to @user
        else
            render 'new'
        end

        redirect_to user_path
    end

    def show
        @user = User.find params[:id]
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end

    def myprofile
        @user = current_user
        if @user == nil
            redirect_to root_path, flash: {:alert => 'No user found'}
        end
    end

    def users
        redirect_to users_myprofile_path
    end

    private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:address,:born_on,:born_at, :admin)
    end
end
