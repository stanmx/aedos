class AddMinorsInfoToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :minors_number, :integer
    add_column :searches, :minors_ages, :integer
  end

  def self.down
    remove_column :searches, :minors_ages
    remove_column :searches, :minors_number
  end
end
