require 'rails_helper'

RSpec.describe GamesController, type: :controller do
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
                  :slots_taken => 10)
    end
  end

  describe "When trying to filter by name with a valid sport name" do
    it "returns a valid list of games filtered by that sport name" do
      get  :index, :params => {:name_search => "Basketball"}

      expect(assigns(:games).length).not_to eq(0)

      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"basketball"))

      expect(assigns(:games)).not_to include(Game.find_by(:sport_name=>"Spikeball"))
      expect(assigns(:games)).not_to include(Game.find_by(:sport_name=>"Football"))

    end

  end

  describe "When trying to filter by name with an empty sport name" do
    it "returns the list of all games" do
      get  :index, :params => {:name_search => ""}

      expect(assigns(:games).length).to eq(5)

      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Spikeball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Football"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"soccer"))

    end

  end

  describe "When trying to filter by name with an invalid sport name" do
    it "returns an empty list of games" do
      get  :index, :params => {:name_search => "invalid"}

      expect(assigns(:games).length).to eq(0)
    end
  end

  describe "When the only available button is not checked" do
    it "Shows the entire list of games" do
      get  :index, :params => {:only_available => 0}

      expect(assigns(:games).length).to eq(5)

      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Spikeball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Football"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"soccer"))

    end
  end

  describe "When the only available button is checked" do
    it "Shows the entire list of games" do
      get  :index, :params => {:only_available => 1}

      expect(assigns(:games).length).to eq(4)

      expect(assigns(:games)).not_to include(Game.find_by(:sport_name=>"soccer"))

    end
  end



  describe "When trying to filter by zipcode" do
    it "returns a valid list of games filtered by that zipcode" do
      get  :index, :params =>{:zip_search => "10010"}
      expect(assigns(:games).length).to eq(1)
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"soccer"))
    end
  end

  describe "When trying to filter by blank zipcode" do
    it "returns a valid list of games filtered by that zipcode" do
      get  :index, :params =>{:zip_search => ""}
      expect(assigns(:games).length).to eq(5)
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"basketball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Spikeball"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Football"))
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"soccer"))
    end
  end

  describe "When trying to filter by invalid zipcode" do
    it "returns a valid list of games filtered by that zipcode" do
      get  :index, :params =>{:zip_search => "abc"}
      expect(assigns(:games).length).to eq(0)
      expect(assigns(:games)).not to include(Game.find_by(:sport_name=>"soccer"))
    end
  end

  describe "When trying to filter by zip code and sport name" do
    it "returns a list of games with sport name equal to the sport name search and with same zip code" do
      get  :index, :params => {:name_search => "Basketball", :zip_search => 10025}
      expect(assigns(:games).length).to eq(1)

      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"basketball"))

      expect(assigns(:games)).not_to include(Game.find_by(:sport_name=>"basketball"))

    end
  end

  describe "When trying to filter by sport name, zipcode and only available" do
    it "returns a valid list of games filtered by that zipcode" do
      get  :index, :params =>{:zip_search => "10024", :only_available => 0, :name_search=>"Basketball"}
      expect(assigns(:games).length).to eq(1)
      expect(assigns(:games)).to include(Game.find_by(:sport_name=>"Basketball"))
    end
  end

end