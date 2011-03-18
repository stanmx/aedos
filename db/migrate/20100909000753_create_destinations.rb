class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.integer :city_id
      t.text :description
      t.text :attraction
      t.text :gastronomy
      t.text :recommendations

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
