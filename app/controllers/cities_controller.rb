class CitiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def index
    @cities = City.order("created_at desc")
    respond_with @cities
  end
  
  def create
    @cities = City.create(params[:city])
    redirect_to cities_path
  end  
  
  def new
    @city = City.new
  end
  
  def edit
    @city = City.find_by_id(params[:id])
  end 

  def update 
    @city = City.find_by_id(params[:id])

    if @city.update_attributes(params[:city])
      redirect_to cities_path
    else
      render "edit"
    end
  end
  
end
