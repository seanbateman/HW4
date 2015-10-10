class User < ActiveRecord::Base
    def create_user!(hash)
        hash.merge!(session_token: SecureRandom.base64)
        @user = User.create!(hash)
    end    
end    