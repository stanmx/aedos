class AddJuniorMaxCapacityToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :junior_max_capacity, :integer
  end

  def self.down
    remove_column :rooms, :junior_max_capacity
  end
end
