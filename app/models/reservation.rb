class Reservation < ActiveRecord::Base
  validates :name, :last_name, :address, :phone, :card_number, :security_code, :card_name, :last_name1, :rate, :search, :presence => true
  validates :company_name, :company_address, :rfc, :presence => { :if => :invoice }

  belongs_to :rate
  belongs_to :search
end
