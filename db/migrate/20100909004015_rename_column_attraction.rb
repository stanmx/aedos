class RenameColumnAttraction < ActiveRecord::Migration
  def self.up
    rename_column :destinations, :attraction, :attractions
  end

  def self.down
  end
end
