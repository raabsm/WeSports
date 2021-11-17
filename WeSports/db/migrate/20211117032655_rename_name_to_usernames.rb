class RenameNameToUsernames < ActiveRecord::Migration
  def change
    rename_column :players, :name, :username
  end
end
