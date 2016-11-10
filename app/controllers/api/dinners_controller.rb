class Api::DinnersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :enable_cors
	before_action :set_default_format

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

	def show
		@dinner=Dinner.find(params[:id])
			render :json => {
				:data => @dinner.return_json
			}
	end
		# return json return_json(@dinners)
	
	def create
		@dinner=Dinner.new(dinner_params)
		@dinner.save

		render :json => {
				:data => "OK"
			}
	end

	def destroy
		@dinner=Dinner.find(params[:id])
		@dinner.destroy
		
		render :json => {
				:data => "OK"
			}		
	end
	
	private

  def enable_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, auth_token, *'
    response.headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Request-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport,  X-Remote, api_key, *'
  end

  def set_default_format
    request.format = 'json'
  end

	def dinner_params
		params.require(:dinner).permit(:name,:zip,:district,:address,:lat,:lng,:style,:price_level,:style_id,:avatar,photos_attributes: [:avatar])
	end
end
