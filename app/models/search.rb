class Search < ActiveRecord::Base
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validate :date_range

  has_many :room_searches, :dependent => :destroy 
  accepts_nested_attributes_for :room_searches, :allow_destroy => true

  has_one :reservation

  def date_range
    errors.add(:start_date, 'can not be greater than end date') if start_date > end_date

    errors.add(:start_date, 'can not be the same as end date') if start_date.to_date == end_date.to_date

    errors.add(:start_date, 'can not be in the past') if start_date.to_date < Date.today
  end

  def adults_max
    max = 0
    room_searches.each{|r| max = r.adults_number if r.adults_number > max}
    max
  end

  def children_max
    max = 0
    room_searches.each{|r| max = r.minors_number if r.minors_number > max}
    max
  end

  def nights
    (start_date.to_date..end_date.to_date).count - 1
  end

  def total_adults
    total = 0
    room_searches.each{|r| total += r.adults_number}
    total
  end

  def total_children
    total = 0
    room_searches.each{|r| total += r.minors_number}
    total
  end

  def total_rooms
    room_searches.size
  end
end
