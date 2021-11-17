class PlayerGame < ActiveRecord::Base
  def self.add_pair(game_id, player_id)
    game_valid, game_notice = Game.check_game_exist(game_id)
    player_valid, player_notice = Player.check_player_exist(player_id)
    if game_valid and player_valid
      create!(player_id: player_id, game_id: game_id)
      notice = "Successfully added pair to table"
    end
    return valid, notice
  end
end
