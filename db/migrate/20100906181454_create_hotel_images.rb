class CreateHotelImages < ActiveRecord::Migration
  def self.up
    create_table :hotel_images do |t|
      t.integer :hotel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hotel_images
  end
end
