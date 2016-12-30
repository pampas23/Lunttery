FactoryGirl.define do
  factory :dinner do
  	name "富霸王豬腳"
  	lat 25.05458
  	lng 121.5316343
  	style do
  		FactoryGirl.create(:style)
  	end	
  end
end
