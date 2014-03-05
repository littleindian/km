class User < ActiveRecord::Base
  has_many :awards, dependent: :destroy

  def self.from_omniauth(auth)
    where(auth.slice(:provider,:uid)).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
     create! do |user|
     user.provider = auth["provider"]
     user.uid = auth["uid"]
     user.name = auth["info"]["name"]
     user.email = auth["info"]["email"]
     user.website = auth["provider"]
     user.oauth_token = auth["credentials"]["token"]
     user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"])
     user.save!
    end
  end


  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

end
