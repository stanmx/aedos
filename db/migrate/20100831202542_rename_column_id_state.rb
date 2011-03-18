class RenameColumnIdState < ActiveRecord::Migration
  def self.up
    rename_column :cities, :id_state, :state_id
  end

  def self.down
  end
end
