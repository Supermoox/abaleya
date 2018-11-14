class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]


  def index
    @journeys = Journey.all.paginate(page: params[:page], per_page: 10).order("departure DESC")
    @search = Search.new
  end


  def show

  end


  def new
   # if current_user.transporter
      @journey = Journey.new
   # else
    #  redirect_to root_path
   # end
  end


  def edit
    unless user_signed_in? && @journey.user == current_user
      redirect_to root_path
    end
  end

  def create
    @journey = current_user.journeys.build(journey_params)

    #@journey = Journey.new(journey_params)

    respond_to do |format|
      if @journey.save
        format.html { redirect_to @journey, notice: 'Journey was successfully created.' }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to @journey, notice: 'Journey was successfully updated.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @journey.destroy
    respond_to do |format|
      format.html { redirect_to journeys_url, notice: 'Journey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_journey
      @journey = Journey.find(params[:id])
    end

    def journey_params
      params.require(:journey).permit(:price, :departure, :arrival, :total_seats, :description, :from_id, :to_id, :bus_id, seats_attributes: [:id, :_destroy, :seat_number, :journey_id])
    end
end
