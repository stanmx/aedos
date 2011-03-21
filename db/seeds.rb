# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
state = State.create(:name => 'Baja California')
city = City.create(:state => state, :name => 'Tijuana')

hotel = Hotel.create(:city => city, :status => true, :name => 'Hotel Uno', :description => 'None')
room1 = Room.new(:name => 'Room 1', :adult_max_capacity => 2, :child_max_capacity => '2', :description => 'None')
room2 = Room.new(:name => 'Room 2', :adult_max_capacity => 4, :child_max_capacity => '4', :description => 'None')

rate1 = Rate.new(:start_date => Date.parse('2011-01-01'), :end_date => Date.parse('2011-03-01'))
room1.rates << rate1

rate2 = Rate.new(:start_date => Date.parse('2011-02-01'), :end_date => Date.parse('2011-03-01'))
room2.rates << rate2

hotel.rooms << room1
hotel.rooms << room2
hotel.save
