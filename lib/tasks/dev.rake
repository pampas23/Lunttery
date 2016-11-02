namespace :dev do
	task :fake_dinner => :environment do
		Dinner.create( :name => "漢堡寶", :discription => "假資料")
		puts "新增一筆成功"
	end

	task :fake_user => :environment do
		User.create( :email => Faker::Internet.email, :password => "123456")
		puts "新增一筆user成功"
	end

	task :get_google => :environment do
		google_config = Rails.application.config_for(:google_place)
		url=google_config["google_linked"]
		json_string = RestClient.get(url)
		data = JSON.parse( json_string )
				
		 data["results"].each do |d|
		 existing = Dinner.find_by_place_id(d["place_id"])
		 if existing
		 		puts "#{d["name"]}已經有資料了"
		 else
		  	Dinner.create(:name=>d["name"],:address=>d["vicinity"],:lat=>d["geometry"]["location"]["lat"],:lng=>d["geometry"]["location"]["lng"],:place_id=>d["place_id"],:rating=>d["rating"])
		  	puts "新增#{d["name"]}成功"
		 end
		end 
	end
end