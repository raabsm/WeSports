class AddUidAndProviderToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :uid, :string
    add_column :players, :provider, :string
  end
end
