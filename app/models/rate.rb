class Rate < ActiveRecord::Base
  belongs_to :room
  
  validate :city, :presence => true
  validate :start_date, :presence => true
  validate :end_date, :presence => true
  validate :date_range
  validate :persons_number, :presence => true
  validate :adults_number, :presence => true


  def date_range
    errors.add(:start_date, 'can not be greater than end date') if start_date > end_date
  end
  
  #def find_by_search_form(@search)
  #  result = Rate.joins(:room => [{:hotel => :city}]).where(:cities => {:name => @search.city}).where('start_date <= ?', @search.start_date).where('end_date >= ?', @search.end_date).where('capacity >= ?', @search.rooms_number).where('adult_max_capacity <= ?', @search.persons_number).includes(:room)
    
  #  result.where()
    
  #end
end
