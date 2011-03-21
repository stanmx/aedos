class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :rates, :dependent => :destroy 
  accepts_nested_attributes_for :rates, :allow_destroy => true

  def total(search)
    # Hay que hacer los calculos
    total = 0
    search.room_searches.each do |r|
      total += r.adults_number + r.minors_number
    end
    total
  end
end
