class AddAgesToHotels < ActiveRecord::Migration
  def self.up
    add_column :hotels, :infant_start_age, :integer
    add_column :hotels, :infant_end_age, :integer
    add_column :hotels, :minor_start_age, :integer
    add_column :hotels, :minor_end_age, :integer
    add_column :hotels, :junior_start_age, :integer
    add_column :hotels, :junior_end_age, :integer
  end

  def self.down
    remove_column :hotels, :junior_end_age
    remove_column :hotels, :junior_start_age
    remove_column :hotels, :minor_end_age
    remove_column :hotels, :minor_start_age
    remove_column :hotels, :infant_end_age
    remove_column :hotels, :infant_start_age
  end
end
