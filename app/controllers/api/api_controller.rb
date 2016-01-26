class Api::ApiController < ActionController::Base
  TOKEN = 'this is a token'
  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      # @user = User.where(api_key: token).first
      token == TOKEN
    end
  end
end
