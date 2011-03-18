class AddCityToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :city, :string
  end

  def self.down
    remove_column :searches, :city
  end
end
