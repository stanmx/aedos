class FiscalsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_hotel
  uses_tiny_mce :only => [ :new, :edit, :create, :update ], :options => { :theme => 'simple' }
  respond_to :html
  
  def index
    @fiscals = @hotel.fiscals.order("created_at desc")
    respond_with @fiscals
  end
  
  def show 
    @fiscal = Fiscal.find_by_id(params[:id])
    respond_with @fiscal
  end
  
  def new
    @fiscal = Fiscal.new
  end
  
  def create
    @fiscal = @hotel.fiscals.new(params[:fiscal])
    
    if @fiscal.save
      redirect_to hotel_fiscals_path
    else
      render "new"
    end
  end 
  
  def edit
    @fiscal = Fiscal.find_by_id(params[:id])
  end 
  
  def update 
    @fiscal = Fiscal.find_by_id(params[:id])
     @hotel = @fiscal.hotel
    
    if @fiscal.update_attributes(params[:fiscal])
      redirect_to hotel_fiscals_path(@hotel)
    else
      render "edit"
    end
  end
  
  def destroy
    fiscal = Fiscal.find_by_id(params[:id])
    fiscal.destroy
    redirect_to hotel_fiscals_path, :notice => "Fiscal info was deleted"
  end
  

private
    def find_hotel
      @hotel = Hotel.find_by_id(params[:hotel_id])
    end  

end
