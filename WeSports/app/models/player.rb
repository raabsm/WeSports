class Player < ActiveRecord::Base
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
