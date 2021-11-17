class Player < ActiveRecord::Base
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  
  def self.create_from_omniauth(auth)
        Player.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
        end
    end
end
