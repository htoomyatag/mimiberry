class Users::SessionsController < Devise::SessionsController
  
    def after_sign_out_path_for(users)
      user_session_path
    end

    def after_sign_in_path_for(users)
      cloths_path
    end




end
