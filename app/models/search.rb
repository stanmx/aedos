class Search < ActiveRecord::Base
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validate :date_range

  has_many :room_searches
  accepts_nested_attributes_for :room_searches

  def date_range
    errors.add(:start_date, 'can not be greater than end date') if start_date > end_date
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
end
