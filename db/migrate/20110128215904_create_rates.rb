class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.integer :room_id
      t.decimal :simple_rate, :precision => 10, :scale => 2
      t.decimal :double_rate, :precision => 10, :scale => 2
      t.decimal :triple_rate, :precision => 10, :scale => 2
      t.decimal :quad_rate, :precision => 10, :scale => 2
      t.decimal :quintuple_rate, :precision => 10, :scale => 2
      t.decimal :sextuple_rate, :precision => 10, :scale => 2
      t.decimal :infant_rate, :precision => 10, :scale => 2
      t.decimal :minor_rate, :precision => 10, :scale => 2
      t.decimal :junior_rate, :precision => 10, :scale => 2
      t.decimal :minor_breakfast, :precision => 10, :scale => 2
      t.decimal :adult_breakfast, :precision => 10, :scale => 2
      t.decimal :aeto_comission, :precision => 5, :scale => 2
      t.decimal :tax, :precision => 5, :scale => 2
      t.decimal :ish, :precision => 5, :scale => 2
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
