class AddMinDaysToRates < ActiveRecord::Migration
  def self.up
    add_column :rates, :min_days, :integer
  end

  def self.down
    remove_column :rates, :min_days
  end
end
