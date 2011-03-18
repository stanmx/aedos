class AddRatesExpiredToRates < ActiveRecord::Migration
  def self.up
    add_column :rates, :rates_expired, :datetime
  end

  def self.down
    remove_column :rates, :rates_expired
  end
end
