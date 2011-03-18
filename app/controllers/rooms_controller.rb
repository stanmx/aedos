class RoomsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :find_hotel
    uses_tiny_mce :only => [ :new, :edit, :create, :update ], :options => { :theme => 'simple' }
    respond_to :html

    def index
      @rooms = @hotel.rooms.order("created_at desc")
      respond_with @rooms
    end

    def show 
      @room = Room.find_by_id(params[:id])
      respond_with @room
    end

    def new
      @room = Room.new
      @room.rates.build
	    #@room.start_date = "2011-01-01 00:00:00 UTC"
	    #@room.end_date = "2011-12-31 00:00:00 UTC"
    end

    def create
      @room = @hotel.rooms.new(params[:room])

      if @room.save
        redirect_to hotel_rooms_path
      else
        render "new"
      end
    end 

    def edit
      @room = Room.find_by_id(params[:id])
	    #@room.start_date = "2011-01-01 00:00:00 UTC"
	    #@room.end_date = "2011-12-31 00:00:00 UTC"
    end 

    def update 
      @room = Room.find_by_id(params[:id])
       @hotel = @room.hotel

      if @room.update_attributes(params[:room])
        redirect_to hotel_room_path(@hotel)
      else
        render "edit"
      end
    end

    def destroy
      room = Room.find_by_id(params[:id])
      room.destroy
      redirect_to hotel_rooms_path, :notice => "Room info was deleted"
    end


  private
      def find_hotel
        @hotel = Hotel.find_by_id(params[:hotel_id])
      end

end
