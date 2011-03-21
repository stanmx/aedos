class CreateRoomSearches < ActiveRecord::Migration
  def self.up
    create_table :room_searches do |t|
      t.integer :adults_number
      t.integer :minors_number
      t.integer :minors_ages
      t.integer :search_id

      t.timestamps
    end
  end

  def self.down
    drop_table :room_searches
  end
end
