class CreateRoomAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :room_availabilities do |t|
      t.integer :room_id
      t.date :date
      t.decimal :package_price
      t.decimal :one_person_price
      t.integer :rooms_number
      t.boolean :status

      t.timestamps
    end
  end

  def self.down
    drop_table :room_availabilities
  end
end
