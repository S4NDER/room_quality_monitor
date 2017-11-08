class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

      def google_oauth2

        @user = User.from_omniauth(request.env['omniauth.auth'])

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
        else
          session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) 
          redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
        end
      end
      
      
      def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
      

      def failure
        redirect_to root_path
      end
end