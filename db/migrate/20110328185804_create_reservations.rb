class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.string :phone
      t.string :cell_phone
      t.integer :card_type
      t.integer :card_number
      t.datetime :expiration_date
      t.integer :security_code
      t.string :card_name
      t.string :last_name1
      t.string :last_name2
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :invoice
      t.string :company_name
      t.string :company_address
      t.string :rfc

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
