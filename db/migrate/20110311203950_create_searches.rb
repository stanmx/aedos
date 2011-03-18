class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :rooms_number
      t.integer :adults_number

      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
