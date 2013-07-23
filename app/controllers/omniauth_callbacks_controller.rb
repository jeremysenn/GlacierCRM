class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  require 'google/api_client'

  def all
    raise request.env["omniauth.auth"].to_yaml
  end
  alias_method :google_oauth2, :all
end
