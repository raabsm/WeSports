class Game < ActiveRecord::Base
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
end
