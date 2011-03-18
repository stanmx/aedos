class HotelsController < ApplicationController
  before_filter :authenticate_user!
  uses_tiny_mce :only => [ :new, :edit, :create, :update ], :options => { :theme => 'simple' }
  respond_to :html
  
  def index
    @hotels = Hotel.name_like(params[:search]).paginate :page => params[:page], :per_page => 15 
    #@hotels = Hotel.order("created_at desc")
    respond_with @hotels
  end
  
  def show 
    @hotel = Hotel.find_by_id(params[:id])
    respond_with @hotel
  end
  
  def new
    @hotel = Hotel.new
    @hotel.hotel_images.build 
  end
  
  def create
    @hotel = Hotel.new(params[:hotel])
    
    if @hotel.save
      redirect_to hotels_path
    else
      render "new"
    end
  end 
  
  def edit
    @hotel = Hotel.find_by_id(params[:id])
  end 
  
  def update 
    @hotel = Hotel.find_by_id(params[:id])
    
    if @hotel.update_attributes(params[:hotel])
      redirect_to hotels_path
    else
      render "edit"
    end
  end
  
  def destroy
    hotel = Hotel.find_by_id(params[:id])
    hotel.destroy
    redirect_to hotels_path, :notice => "Hotel was deleted"
  end
  
end
