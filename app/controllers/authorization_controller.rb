require 'google/api_client/client_secrets'
require 'google/apis/oauth2_v2'

class AuthorizationController < ActionController::API
  def create
    client = Google::APIClient::ClientSecrets.new('web' => {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      redirect_uri: 'http://localhost:4200/oauth2callback'
    }).to_authorization


    client.grant_type = 'authorization_code'
    client.code = params['authorization_code']

    token = client.fetch_access_token!

    oauth_client = Google::Apis::Oauth2V2::Oauth2Service.new
    oauth_client.authorization = client
    user_info = oauth_client.get_userinfo

    auth_token = AuthToken.where(email: user_info.email).first_or_create
    auth_token.update token: token['access_token']

    render json: {
      email: user_info.email,
      token: token['access_token']
    }
  end
end
