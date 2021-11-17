class PlayerGame < ActiveRecord::Base

  has_many :games
  has_many :players

  def self.add_pair(game_id, player_id)
    game_valid, game_notice = Game.check_game_exist(game_id)
    player_valid, player_notice = Player.check_player_exist(player_id)
    if game_valid and player_valid
      valid = true
      create!(player_id: player_id, game_id: game_id)
      notice = "Successfully joined game"
    else
      valid = false
      notice = "Either game or player doesn't exist"
    end
    return valid, notice
  end
end
