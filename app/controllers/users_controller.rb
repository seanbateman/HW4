class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:user_id, :email)
    end
    
    def new
        
    end
    
    def create
        if User.exists?(user_id: params['user']['user_id'])
            flash[:notice] = "User ID is not unique"
            redirect_to new_user_path
        else
            @user = User.new(user_params)
            @user.create_user!(:user_id => params['user']['user_id'], :email => params['user']['email'])
            flash[:notice] = "Welcome #{@user.user_id}. Your account was successfully created"
            redirect_to login_path
        end     
    end
end    