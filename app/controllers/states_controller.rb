class StatesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def index
    @states = State.order("created_at desc")
    respond_with @states
  end

  def create
    @state = State.create(params[:state])
    redirect_to states_path
  end
  
  def new
    @state = State.new
  end

  def edit
    @state = State.find_by_id(params[:id])
  end 

  def update 
    @state = State.find_by_id(params[:id])

    if @state.update_attributes(params[:state])
      redirect_to states_path
    else
      render "edit"
    end
  end  

  
end
