class DestinationsController < ApplicationController
  before_filter :authenticate_user!
  uses_tiny_mce :only => [ :new, :edit, :create, :update ], :options => { :theme => 'simple' }
  respond_to :html
  
  def index
    #@cities = City.name_like(params[:search])    
    #if @cities.present?
    #@destinations = @cities.collect(&:destination).flatten
    #@destinations = @destinations.paginate(:page => params[:page], :per_page  => 5, :order => "created_at DESC")
    #end    
    #@destinations ||= Destination.paginate( :page => params[:page], :per_page  => 5, :order => "created_at DESC") 
    
    @destinations = Destination.paginate :page => params[:page], :per_page => 5 
    respond_with @destinations
  end

  def show 
    @destination = Destination.find_by_id(params[:id])
    respond_with @destination
  end
  
  def new
    @destination = Destination.new
    @destination.destination_images.build 
  end
  
  def create
    @destination = Destination.new(params[:destination])
    
    if @destination.save
      redirect_to destinations_path
    else
      render "new"
    end
  end 
  
  def edit
    @destination = Destination.find_by_id(params[:id])
  end 
  
  def update 
    @destination = Destination.find_by_id(params[:id])
    
    if @destination.update_attributes(params[:destination])
      redirect_to destinations_path
    else
      render "edit"
    end
  end
  
  def destroy
    destination = Destination.find_by_id(params[:id])
    destination.destroy
    redirect_to destinations_path, :notice => "Destination was deleted"
  end
  
end
