class Rate < ActiveRecord::Base
  belongs_to :room
  
#  validate :city, :presence => true
  validate :start_date, :presence => true
  validate :end_date, :presence => true
  validate :date_range
#  validate :persons_number, :presence => true
#  validate :adults_number, :presence => true


  def date_range
    errors.add(:start_date, 'can not be greater than end date') if start_date > end_date
  end
  
  #def find_by_search_form(@search)
  #  result = Rate.joins(:room => [{:hotel => :city}]).where(:cities => {:name => @search.city}).where('start_date <= ?', @search.start_date).where('end_date >= ?', @search.end_date).where('capacity >= ?', @search.rooms_number).where('adult_max_capacity <= ?', @search.persons_number).includes(:room)
    
  #  result.where()
    
  #end
  
  scope :search, lambda{|city, start_date, end_date, adults, children| joins(:room => [{:hotel => :city}]).where(:cities => {:name => city}).where('start_date <= ?', start_date).where('end_date >= ?', end_date).where('rooms.adult_max_capacity >= ?', adults).where('rooms.child_max_capacity >= ?', children).includes(:room) } 


  def total(search)
    rate = 0

    minors_ages = []
    search.room_searches.each do |s| 
      rate += case s.adults_number
        when 1 then simple_rate
        when 2 then double_rate
        when 3 then triple_rate
        when 4 then quad_rate
        when 5 then quintuple_rate
        else sextuple_rate
      end

      minors_ages << s.minor1_age if s.minors_number >= 1 
      minors_ages << s.minor2_age if s.minors_number == 2 
    end

    days = (search.start_date.to_date..search.end_date.to_date).count - 1

    total_rate = calculate_rate(rate, days)
    minors_rate = calculate_minors(minors_ages, days) if minors_ages.size > 0

    return 0 if minors_rate == -1
    total_rate + minors_rate
  end

  private
  def calculate_minors(minors_ages, days)
    rate = 0
    minors_ages.each do |age|
      current_rate = -1

      if age >= room.hotel.infant_start_age and age <= room.hotel.infant_end_age
        current_rate = infant_rate if !infant_rate.nil?
      elsif age >= room.hotel.minor_start_age and age <= room.hotel.minor_end_age
        current_rate = minor_rate if !minor_rate.nil?
      elsif age >= room.hotel.junior_start_age and age <= room.hotel.junior_end_age
        current_rate = junior_rate if !junior_rate.nil?
      end

      return current_rate if current_rate == -1
      rate += current_rate
    end

    rate * days
  end

  def calculate_rate(rate, days)
    total_rate = (rate * days)
    total_rate += total_rate * aeto_comission
    total_rate += total_rate * tax
    total_rate += total_rate * ish

    total_rate
  end
end
