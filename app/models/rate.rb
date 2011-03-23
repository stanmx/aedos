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

    search.room_searches.each do |s| 
      rate += case s.adults_number
        when 1 then simple_rate
        when 2 then double_rate
        when 3 then triple_rate
        when 4 then quad_rate
        when 5 then quintuple_rate
        else sextuple_rate
      end
    end

    days = (search.start_date.to_date..search.end_date.to_date).count

    total_rate = (rate * days)
    total_rate += total_rate * aeto_comission
    total_rate += total_rate * tax
    total_rate += total_rate * ish

    total_rate
  end
end
