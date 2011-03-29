class ReservationsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :show]

  def index
    @reservations = Reservation.all.paginate :page => params[:page], :per_page => 15
  end

  def show
    @reservation = Reservation.find params[:id]  
    puts @reservation.search.inspect
  end

  def new
    @rate = Rate.find params[:rate]
    @search = Search.find params[:search]

    @reservation = Reservation.new
  end

  def create
    @rate = Rate.find params[:rate]
    @search = Search.find params[:search]

    @reservation = Reservation.new params[:reservation]
    @reservation.rate = @rate
    @reservation.search = @search

    if @reservation.save
      redirect_to root_path, :notice => "Su reservacion fue realizada"
    else
      render 'new'
    end
  end
end
