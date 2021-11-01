class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string   :sport_name
      t.string   :zipcode
      t.integer  :slots_to_be_filled
      t.integer  :slots_taken
      t.datetime :game_start_time
      t.datetime :game_end_time
      t.timestamps
    end
  end
end
