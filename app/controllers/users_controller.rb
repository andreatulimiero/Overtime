class UsersController < ApplicationController
    @@info =
        [:first_name,
        :surname,
        :address,
        :born_on,
        :born_at,
        :team]
        private

    def myprofile
        @user = current_user
        if @user == nil
            redirect_to root_path, flash: {:alert => 'No user found'}
        end
    end

    def users
        redirect_to users_myprofile_path
    end

    def user_params
      params.require(:user).permit(:first_name,:surname,:email,:address,:born_on,:born_at)
    end
end
