require 'rails_helper'

RSpec.describe Api::MealsController, type: :request do
	before(:all) do
			@style = FactoryGirl.create(:style)
	end
	let(:dinner) { FactoryGirl.create(:dinner)}
  let(:meal) { FactoryGirl.create(:meal,:style_id => @style.id,:dinner_id =>dinner.id)}
  let(:user) { FactoryGirl.create(:user)}
  let(:admin_user) { FactoryGirl.create(:admin_user)}

	describe "GET api/meals" do
		it "api/meal#index" do
	    get "/api/meals", params: {lat: 25.0521723, lng: 121.5321898, id: meal.id}
	    expect(response).to have_http_status(200)
	    expect(response.body).to include("富霸王")
		end

		it "api/meal#index when log in" do
	    get "/api/meals", params: {lat: 25.0521723, lng: 121.5321898, id: meal.id, authentication_token: "qwerty", distant: 500, price: 500,style_ids: [1,2,3] }    
	    expect(response).to have_http_status(200)
		end		
	end

	describe "GET api/meal" do
		it "api/meal#index" do
	    get "/api/meals/#{meal.id}", params: {lat: 25.0521723, lng: 121.5321898}
	    expect(response).to have_http_status(200)
	    expect(response.body).to include("富霸王")
		end

	end	
end
