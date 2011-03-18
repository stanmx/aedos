class SearchesController < ApplicationController
  respond_to :html

  def index
    @search = Search.new 
  end

  def create
    @search = Search.new(params[:search])

    if @search.valid?
      #@rates = Rate.where('start_date <= ?', @search.start_date).where('end_date >= ?', @search.end_date).includes(:room)
      @rates = Rate.joins(:room => [{:hotel => :city}]).where(:cities => {:name => @search.city}).where('start_date <= ?', @search.start_date).where('end_date >= ?', @search.end_date).where('rooms_number >= ?', @search.rooms_number).where('capacity >= ?', @search.persons_number).where('adult_max_capacity >= ?', @search.adults_number).includes(:room)
    end

    render 'index'
  end
end