class SearchesController < ApplicationController
  respond_to :html

  def index
    @search = Search.new 
    @search.room_searches << RoomSearch.new(:adults_number => 0, :minors_number => 0)
  end

  def create
    @search = Search.new(params[:search])

    if @search.valid?
      @rates = Rate.search(@search.city, @search.start_date, @search.end_date, @search.adults_max, @search.children_max)
    end

    render 'index'
  end
end
