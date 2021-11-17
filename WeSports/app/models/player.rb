class Player < ActiveRecord::Base
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  
  def self.create_from_omniauth(auth)
        Player.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
        end
  end

  def self.check_player_exist(player_id)
    if exists?(id: player_id)
      notice = ""
      valid = true
    else
      notice = "Error: Player does not exist"
      valid = false
    end
    return valid, notice
  end
end
