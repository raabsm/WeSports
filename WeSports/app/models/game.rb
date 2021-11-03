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
end
