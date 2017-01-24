require 'rails_helper'

RSpec.describe Api::CouponTracksController, type: :request do
	before(:all) do
			@style = FactoryGirl.create(:style)
	end
	let(:dinner) { FactoryGirl.create(:dinner)}
	let(:dinner_onsale) { FactoryGirl.create(:dinner_onsale)}
  let(:meal) { FactoryGirl.create(:meal,:style_id => @style.id,:dinner_id =>dinner.id)}
  let(:user) { FactoryGirl.create(:user)}
  let(:admin_user) { FactoryGirl.create(:admin_user)}

	describe "api/coupon_tracks#edit" do

		it "return no sale" do
	     get "/api/dinners/#{dinner.id}/coupon_tracks/#{user.id}/edit"
	     expect(response).to have_http_status(200)
	     expect(response.body).to include("目前沒有優惠")    
		end

		it "return recieve coupon" do
	     get "/api/dinners/#{dinner_onsale.id}/coupon_tracks/#{user.id}/edit"
	     expect(response).to have_http_status(200)
	     expect(response.body).to include("領取餐券成功")
		end
		
		it "recieve coupon once a day" do
	     get "/api/dinners/#{dinner_onsale.id}/coupon_tracks/#{user.id}/edit"
	     get "/api/dinners/#{dinner_onsale.id}/coupon_tracks/#{user.id}/edit"
	     expect(response).to have_http_status(200)
	     expect(response.body).to include("一天只能領一次喔")
		end										
	end
end

