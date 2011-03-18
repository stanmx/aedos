class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :rates, :dependent => :destroy 
  accepts_nested_attributes_for :rates, :allow_destroy => true
end
