class CreateHotels < ActiveRecord::Migration
  def self.up
    create_table :hotels do |t|
      t.integer :city_id
      t.boolean :status
      t.string :name
      t.text :description
      t.string :direction
      t.string :location
      t.string :gmap
      t.text :services
      t.integer :category
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :hotels
  end
end
