class TosController < ApplicationController
  before_action :set_to, only: [:show, :edit, :update, :destroy]

  # GET /tos
  # GET /tos.json
  def index
    @tos = To.all
  end

  # GET /tos/1
  # GET /tos/1.json
  def show
  end

  # GET /tos/new
  def new
    @to = To.new
  end

  # GET /tos/1/edit
  def edit
  end

  # POST /tos
  # POST /tos.json
  def create
    @to = To.new(to_params)

    respond_to do |format|
      if @to.save
        format.html { redirect_to @to, notice: 'To was successfully created.' }
        format.json { render :show, status: :created, location: @to }
      else
        format.html { render :new }
        format.json { render json: @to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tos/1
  # PATCH/PUT /tos/1.json
  def update
    respond_to do |format|
      if @to.update(to_params)
        format.html { redirect_to @to, notice: 'To was successfully updated.' }
        format.json { render :show, status: :ok, location: @to }
      else
        format.html { render :edit }
        format.json { render json: @to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tos/1
  # DELETE /tos/1.json
  def destroy
    @to.destroy
    respond_to do |format|
      format.html { redirect_to tos_url, notice: 'To was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to
      @to = To.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_params
      params.require(:to).permit(:name)
    end
end
