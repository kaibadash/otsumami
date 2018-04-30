# frozen_string_literal: true

class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env["omniauth.auth"]

    user = User.find_or_create_by!(uid: session[:userinfo][:uid])
    user.name = session[:userinfo][:info][:nickname]
    user.image = session[:userinfo][:info][:image]
    user.save!

    # Redirect to the URL you want after successful auth
    redirect_to :sites
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params["message"]
  end
end
