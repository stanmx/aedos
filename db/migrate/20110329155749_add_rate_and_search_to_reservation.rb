class AddRateAndSearchToReservation < ActiveRecord::Migration
  def self.up
    add_column :reservations, :rate_id, :integer
    add_column :reservations, :search_id, :integer
  end

  def self.down
    remove_column :reservations, :rate_id, :integer
    remove_column :reservations, :search_id, :integer
  end
end
