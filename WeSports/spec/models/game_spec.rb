require 'rails_helper'

RSpec.describe Game, type: :model do
  before(:all) do
    if Game.where(:sport_name => "Spikeball").empty?
      Game.create(:sport_name => "Spikeball",
                  :zipcode => "10027",
                  :slots_to_be_filled => 4,
                  :slots_taken => 2)
    end
    if Game.where(:sport_name => "Basketball").empty?
      Game.create(:sport_name => "Basketball",
                  :zipcode => "10024",
                  :slots_to_be_filled => 10,
                  :slots_taken => 0)
    end
    if Game.where(:sport_name => "basketball").empty?
      Game.create(:sport_name => "basketball",
                  :zipcode => "10025",
                  :slots_to_be_filled => 10,
                  :slots_taken => 3)
    end
    if Game.where(:sport_name => "Football").empty?
      Game.create(:sport_name => "Football",
                  :zipcode => "10030",
                  :slots_to_be_filled => 22,
                  :slots_taken => 18)
    end
    if Game.where(:sport_name => "soccer").empty?
      Game.create(:sport_name => "soccer",
                  :zipcode => "10010",
                  :slots_to_be_filled => 10,
                  :slots_taken => 7)
    end
  end

  describe "join_game method" do
    it "increments one to the slots_taken" do
      game = Game.find_by(:sport_name => "soccer")
      previous_slots = game.slots_taken
      game.join_game()
      expect(game.slots_taken).to eq(previous_slots + 1)
    end
  end

  describe "spots_left method" do
    it "calculates the number of available spots left" do
      game = Game.find_by(:sport_name => "soccer")
      expect(game.spots_left).to eq(3)
    end
  end

end