class ChangeScaleToRates < ActiveRecord::Migration
  def self.up
    change_column :rates, :simple_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :double_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :triple_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :quad_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :quintuple_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :sextuple_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :infant_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :minor_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :junior_rate, :decimal, :precision => 12, :scale => 4
    change_column :rates, :minor_breakfast, :decimal, :precision => 12, :scale => 4
    change_column :rates, :adult_breakfast, :decimal, :precision => 12, :scale => 4
    change_column :rates, :aeto_comission, :decimal, :precision => 7, :scale => 4
    change_column :rates, :tax, :decimal, :precision => 7, :scale => 4
    change_column :rates, :ish, :decimal, :precision => 7, :scale => 4
  end

  def self.down
  end
end
