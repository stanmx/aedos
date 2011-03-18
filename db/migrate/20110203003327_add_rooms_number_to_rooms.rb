class AddRoomsNumberToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :rooms_number, :integer
  end

  def self.down
    remove_column :rooms, :rooms_number
  end
end
