class SitsController < ApplicationController
  before_action :set_sit, only: [:show, :edit, :update, :activate, :destroy]


  def index
    @sits = Sit.all.order("created_at DESC")
  end

 
  def show
  end

  def new
    @sit = Sit.new
  end

   def edit
  end

 
  def create
    @sit = Sit.new(sit_params)
    respond_to do |format|
      if @sit.save
        format.html { redirect_to @sit, notice: 'Sit was successfully created.' }
        format.json { render :show, status: :created, location: @sit }
      else
        format.html { render :new }
        format.json { render json: @sit.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @sit.update(sit_params)
        format.html { redirect_to @sit, notice: 'Sit was successfully updated.' }
        format.json { render :show, status: :ok, location: @sit }
      else
        format.html { render :edit }
        format.json { render json: @sit.errors, status: :unprocessable_entity }
      end
    end
  end


  def activate
    @sit.update(occupied: true)
    flash[:success] = "You have Selected  a sit"
    redirect_to @sit.bus.journey
  end

 
  def destroy
    @sit.destroy
    respond_to do |format|
      format.html { redirect_to sits_url, notice: 'Sit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sit
      @sit = Sit.find(params[:id])
    end    

     def sit_params
      params.require(:sit).permit(:number, :seat, :occupied, :bus_id)
    end
end
