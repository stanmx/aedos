class Destination < ActiveRecord::Base
  belongs_to :city
  
  has_many :destination_images, :dependent => :destroy
  accepts_nested_attributes_for :destination_images, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true  
  
end
