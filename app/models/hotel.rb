class Hotel < ActiveRecord::Base
    belongs_to :city
    has_many :fiscals
    has_many :rooms
    has_many :hotel_images, :dependent => :destroy
    accepts_nested_attributes_for :hotel_images, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true  
    
    scope :name_like, lambda { |name| where("name LIKE ?", "%"+name.to_s+"%") }
    
    
    validates_presence_of :name
    validates_presence_of :description
    
    CATEGORY = %w(1 2 3 4 5)
end
