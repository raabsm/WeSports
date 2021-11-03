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

    def self.add_game(game_params)
        puts game_params[:slots_to_be_filled]
        if game_params[:sport_name].empty? or game_params[:zipcode].empty?
            notice = "Error: Missing Zip Code or Sport Name Fields"
            valid = false
        elsif game_params[:slots_to_be_filled].empty? or game_params[:slots_to_be_filled].to_i == 0
            notice = "Error: Total Slots Available not valid"
            valid = false
        else
            notice = "Successfully created #{game_params[:sport_name]} game"
            valid = true
            create!(game_params)
        end
        return valid, notice
    end
end
