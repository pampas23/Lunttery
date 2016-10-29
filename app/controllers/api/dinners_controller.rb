class Api::DinnersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :enable_cors

	def index
		
		if (params[:id])
			@dinner=Dinner.find(params[:id])
			render :json => {
				:data => @dinner.return_json
			}
		else
			@dinners=Dinner.all
			render :json => {
				:data => @dinners.map{|d| d.return_json}
			}
		end
		
	end	
		# return json return_json(@dinners)



	
	private

  def enable_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, auth_token, *'
    response.headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Request-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport,  X-Remote, api_key, *'
  end

	
end
