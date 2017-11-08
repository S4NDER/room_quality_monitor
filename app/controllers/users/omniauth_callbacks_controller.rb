class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

      def google_oauth2

        @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
        else
          session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) 
          flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
          redirect_to new_user_registration_url
        end
      end
      
      
      def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
          flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
          redirect_to new_user_registration_url
        end
      end

      def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          sign_in_and_redirect @user
        else
          session["devise.github_data"] = request.env["omniauth.auth"]
          flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
          redirect_to new_user_registration_url
        end
      end


      

      def failure
        redirect_to root_path
      end
end