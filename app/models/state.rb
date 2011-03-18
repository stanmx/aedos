class State < ActiveRecord::Base
  has_many :cities
  has_many :hotels, :through => :cities
end
