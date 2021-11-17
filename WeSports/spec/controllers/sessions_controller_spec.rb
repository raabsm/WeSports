require 'rails_helper'
require 'simplecov'

RSpec.describe SessionsController, type: :controller do
  before(:all) do
    Game.delete_all
    if Player.where(:email => "Stephane@gmail.com").empty?
      Player.create(:email => "Stephane@gmail.com",
                  :uid => "1",
                  :username => 'Stephane',
                  :provider => 'google_oauth2')
    end
    if Player.where(:email => "Tom@gmail.com").empty?
      Player.create(:email => "Tom@gmail.com",
                  :uid => "2",
                  :username => 'Tom',
                  :provider => 'google_oauth2')
    end
    if Player.where(:email => "Sam@gmail.com").empty?
      Player.create(:email => "Sam@gmail.com",
                  :uid => "3",
                  :username => 'Sam',
                  :provider => 'google_oauth2')
    end
    if Player.where(:email => "Jenny@gmail.com").empty?
      Player.create(:email => "Jenny@gmail.com",
                  :uid => "4",
                  :username => 'Jenny',
                  :provider => 'google_oauth2')
    end
  end
  
  after(:all) do
    Player.delete_all
  end
  
  describe "When Logging in with an existing id" do
    it "returns a valid list of games filtered by that sport name" do
      get  :index, {session[:user_id] => 1}
      
      expect(player.name).to eq('Stephane')
    end

  end
end
  
  