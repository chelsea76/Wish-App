class User < ActiveRecord::Base
	
  def self.from_omniauth(auth_hash)
  	user = User.where(uid: auth_hash['uid'], provider: auth_hash['provider']).first
  	unless user.present?
  	  user = User.create(uid: auth_hash['uid'], provider: auth_hash['provider'])
  	end
    #user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.update_attributes(name: auth_hash['info']['name'], location: auth_hash['info']['location'], url: auth_hash['info']['urls']['Twitter'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    #user.image_url = auth_hash['info']['image']
    #user.url = auth_hash['info']['urls']['Twitter']
    #user.save!
    user
  end
end
