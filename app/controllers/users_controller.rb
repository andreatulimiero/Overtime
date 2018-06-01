class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def new
        @user = User.new
    end

    def index
        if current_user.admin?
            @users = User.all
        else
            redirect_to root_path
        end
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
        if @user == current_user || current_user.admin?
            @user.update(user_params)
            if !params[:user][:image].nil?
                b64 = Base64.encode64(params[:user][:image].read)
                @user.image = b64
                @user.save
            end
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    def destroy
        if @user == current_user || current_user.admin?
            @user = User.find(params[:id])
            @user.destroy
        
            redirect_to root_path
        else 
            redirect_to root_path
        end
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
      params.require(:user).permit( :first_name, :last_name, :email,
                                    :address, :born_on, :born_at, 
                                    :image, :team_id,
                                    :admin)
    end
end
