class CreateFiscals < ActiveRecord::Migration
  def self.up
    create_table :fiscals do |t|
      t.integer :hotel_id
      t.string :business_name
      t.string :commercial_name
      t.string :rfc
      t.string :direction
      t.string :contact_name
      t.string :job_position
      t.string :phone
      t.string :email
      t.text :bank_info

      t.timestamps
    end
  end

  def self.down
    drop_table :fiscals
  end
end
