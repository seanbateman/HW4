class SessionsController < ApplicationController
    def new
    
    end
    
    def create
        @session_user = User.new(user_id: params['user']['user_id'], email: params['user']['email'])
        if User.exists?(user_id: params['user']['user_id'])
            @user = User.find_by(user_id: params['user']['user_id'])
            if @user.email == @session_user.email
                session[:session_token] = @user.session_token
                flash[:notice] = "Logged in as #{@user.user_id}"
                redirect_to movies_path
            else
                flash[:notice] = "Invalid User ID or Email"
                redirect_to login_path
            end    
        else
             flash[:notice] = "Invalid User ID or Email"
             redirect_to login_path
        end     
    end
    
    def destroy
        reset_session
        redirect_to movies_path
    end    
end    