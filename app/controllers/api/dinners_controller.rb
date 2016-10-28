class Api::DinnersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :enable_cors

	def index
		@dinner=Dinner.find(params[:id])
		# return json return_json(@dinners)

	  respond_to do |format|
	    # format.json {render :json => { id: @dinners.id, name: @dinners.name }.to_json}
	    format.json {render :json => @dinner.return_json.to_json}
		end

	private

  def enable_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, auth_token, *'
    response.headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Request-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport,  X-Remote, api_key, *'
  end

	end
end
