class AddPersonsNumberToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :persons_number, :integer
  end

  def self.down
    remove_column :searches, :persons_number
  end
end
