class RemoveNotNeededFieldsFromSearch < ActiveRecord::Migration
  def self.up
    remove_column :searches, :minors_number
    remove_column :searches, :minors_ages
    remove_column :searches, :persons_number
    remove_column :searches, :adults_number
    remove_column :searches, :rooms_number
  end

  def self.down
    add_column :searches, :minors_number, :integer
    add_column :searches, :minors_ages, :integer
    add_column :searches, :persons_number, :integer
    add_column :searches, :adults_number, :integer
    add_column :searches, :rooms_number, :integer
  end
end
