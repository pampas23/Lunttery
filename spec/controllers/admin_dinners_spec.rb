require 'rails_helper'

RSpec.describe Admin::DinnersController, type: :controller do

	before(:all) do
    DatabaseCleaner.clean
    @style = FactoryGirl.create(:style)
  end

  let(:dinner) { FactoryGirl.create(:dinner)}
  let(:meal) { FactoryGirl.create(:meal,:style_id => stye.id,:dinner_id =>dinner.id)}
  let(:user) { FactoryGirl.create(:user)}
  let(:admin_user) { FactoryGirl.create(:admin_user)}

  describe "#index" do
  	it "index with no admin user" do
      get :index
      expect(response).to have_http_status(302)  		
  	end

    it "index with admin user" do
      sign_in(admin_user)
      get :index
      expect(response).to have_http_status(200)     
    end
  end

  describe "#create" do
    before(:all) do
        @dinner_params = {name: "麥當勞", lat: 25.05458, lng: 121.5316343, style_id: @style.id}
    end  	
  	it "create" do
      sign_in(admin_user)
      expect{ post :create,params: {dinner: @dinner_params} }.to change{Dinner.count}.by(1)
  	end
  end

  describe "#update" do
      before(:all) do
          @dinner_params = {name: "富霸王滷蛋"}
      end

      it "changes record" do 
          sign_in(admin_user)
          patch :update, params: {dinner: @dinner_params, id: dinner[:id]}
          expect(Dinner.find(dinner[:id])[:name]).to eq("富霸王滷蛋")
      end
  end

  describe "#destroy" do
      it "delete record" do 
          sign_in(admin_user)
          dinner_to_delete = FactoryGirl.create(:dinner, :style_id => @style.id)
          expect{ delete :destroy,params: {id: dinner_to_delete.id} }.to change{Dinner.count}.by(-1)
      end
  end 
end