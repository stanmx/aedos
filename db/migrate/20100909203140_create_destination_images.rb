class CreateDestinationImages < ActiveRecord::Migration
  def self.up
    create_table :destination_images do |t|
      t.integer :destination_id

      t.timestamps
    end
  end

  def self.down
    drop_table :destination_images
  end
end
