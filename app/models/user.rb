class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :user_meal_likeships,:dependent => :destroy
  has_many :meals,:through => :user_meal_likeships
  
  has_many :coupon_tracks,:dependent => :destroy
  has_many :coupon_used, :through => :coupon_tracks, :source=> :dinner

  before_create :generate_authentication_token
  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
  end
  
  def self.get_fb_data(access_token)
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token, :fields => "id,name,email" } }
    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def get_fb_data
    j = RestClient.get "https://graph.facebook.com/v2.5/me", :params => { :access_token => self.fb_token, :fields => "id,name,email,picture" }
    JSON.parse(j)
  end

  #login form facebook       
  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        #user.fb_raw_data = auth
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.save!
     return user
   end

   def use_coupon(diner)
      sale = false
      message = "目前沒有優惠喔"
      cd_hour = nil
      
      if diner.onsale == "true"
        message = "領取餐券成功"         
        if self.coupon_tracks == []
          self.coupon_used << diner
          sale = true          
          last_coupon_used = nil
        else
          last_coupon_used = self.coupon_tracks.last.created_at
          cd_hour = (Time.now - last_coupon_used)/3600

          if cd_hour < 20
            message = "一天只能領一次喔"
          else
            self.coupon_used << diner
            sale = true
          end
        end       
      end
      return sale,message,last_coupon_used,cd_hour     
   end  
end
