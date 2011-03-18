class AddNewCapacitiesToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :adult_max_capacity, :integer
    add_column :rooms, :child_max_capacity, :integer
  end

  def self.down
    remove_column :rooms, :child_max_capacity
    remove_column :rooms, :adult_max_capacity
  end
end
