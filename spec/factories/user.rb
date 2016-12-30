FactoryGirl.define do
  factory :user do
    sequence(:email) do |n|
      "admin#{n}@gamil.com"
    end
    password "12345678"
    factory :admin_user do
    	role "admin"	
    end
    factory :normal_user do
    	role "normal"	
    end    
  end
end