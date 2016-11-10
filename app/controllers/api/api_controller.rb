class Api::ApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :enable_cors

  before_action :authenticate_user_from_token!

  #if user , then login 
  def authenticate_user_from_token!
      if params[:auth_token].present?
        user = User.find_by_authentication_token( params[:auth_token] )

        # Devise: 設定 current_user
        sign_in(user, store: false) if user
      end
  end

	def enable_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, auth_token, *'
    response.headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Request-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport,  X-Remote, api_key, *'
  end
end
