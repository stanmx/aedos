class HotelImage < ActiveRecord::Base
  belongs_to :hotel
	has_attached_file :photo, :styles => { :small => "90x90#", :thumb => "300x150#", :big => "800x600>" },
	  				          :url => "/hotel_images/:id/:style/:basename.:extension",  
							  :path => ":rails_root/public/hotel_images/:id/:style/:basename.:extension"
							  
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png', 'image/gif']

end
