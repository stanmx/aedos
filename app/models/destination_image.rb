class DestinationImage < ActiveRecord::Base
  belongs_to :destination
	has_attached_file :photo, :styles => { :small => "90x90#", :thumb => "300x150#", :big => "800x600>" },
	  				          :url => "/destination_images/:id/:style/:basename.:extension",  
							  :path => ":rails_root/public/destination_images/:id/:style/:basename.:extension"
							  
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png', 'image/gif']
end
