class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @buses = Bus.all
  end

 
  def show
    @sits = Sit.where(bus_id: @bus.id).order("created_at")
    @emptysits = @sits.where(occupied: nil).order("created_at DESC")
  end

   def new
    @bus = current_user.buses.build
  end

   def edit
  end
 
  def create
    @bus = current_user.buses.build(bus_params)

    respond_to do |format|
      if @bus.save
        format.html { redirect_to @bus, notice: 'Bus was successfully created.' }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to @bus, notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bus
      @bus = Bus.find(params[:id])
    end

     def bus_params
      params.require(:bus).permit(:carrier_name, :registration, :make, :description, seats_attributes: [:id, :_destroy, :seat_number, :bus_id])
    end
end
