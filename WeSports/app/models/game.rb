class Game < ActiveRecord::Base
    has_and_belongs_to_many :players, join_table: 'games_players'

    def player_joined_game?(player_id)
        return players.exists?(player_id)
    end

    def player_join_game(player_id)
        player = Player.find(player_id)
        players << player
        join_game
        return "Successfully Joined Game"
    end

    def spots_left
        if slots_to_be_filled.nil?
            return 0
        elsif slots_taken.nil?
            return slots_to_be_filled
        else
            return slots_to_be_filled - slots_taken
        end
    end

    def update_game(game_params)
        valid, notice = Game.check_valid_game(game_params)
        if valid
            if game_params[:slots_to_be_filled].to_i < slots_taken
                valid = false
                notice = "Error: More Slots Taken (#{slots_taken}) than Available"
            else
                update_attributes!(game_params)
                notice = "Successfully updated game"
            end
        end

        return valid, notice
    end

    def join_game
        update_attributes!({:slots_taken => slots_taken + 1})
    end

    def self.add_game(game_params)
        valid, notice = Game.check_valid_game(game_params)
        if valid
            game_params[:slots_taken] = 0
            create!(game_params)
            notice = "Successfully created #{game_params[:sport_name]} game"
        end
        return valid, notice
    end

    def self.check_valid_game(game_params)
        if game_params[:sport_name].empty? or game_params[:zipcode].empty?
            notice = "Error: Missing Zip Code or Sport Name Fields"
            valid = false
        elsif game_params[:slots_to_be_filled].empty? or game_params[:slots_to_be_filled].to_i == 0
            notice = "Error: Total Slots Available not valid"
            valid = false
        else
            notice = ""
            valid = true
        end
        return valid, notice
    end

    def self.check_game_exist(game_id)
        if exists?(id: game_id)
            notice = ""
            valid = true
        else
            notice = "Error: Game does not exist"
            valid = false
        end
        return valid, notice
    end

end
