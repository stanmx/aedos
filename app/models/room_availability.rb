class RoomAvailability < ActiveRecord::Base
  belongs_to :room
  has_many :room_availabilities
end
