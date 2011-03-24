class ChangeMinorsAgesInRoomSearches < ActiveRecord::Migration
  def self.up
    remove_column :room_searches, :minors_ages
    add_column :room_searches, :minor1_age, :integer
    add_column :room_searches, :minor2_age, :integer
  end

  def self.down
    add_column :room_searches, :minors_ages, :integer
    remove_column :room_searches, :minor1_age
    remove_column :room_searches, :minor2_age
  end
end
