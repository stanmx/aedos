class City < ActiveRecord::Base
  belongs_to :state
  has_many :hotels
  has_one :destination
  
end
