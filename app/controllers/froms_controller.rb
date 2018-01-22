class FromsController < ApplicationController
  before_action :set_from, only: [:show, :edit, :update, :destroy]

  # GET /froms
  # GET /froms.json
  def index
    @froms = From.all
  end

  # GET /froms/1
  # GET /froms/1.json
  def show
  end

  # GET /froms/new
  def new
    @from = From.new
  end

  # GET /froms/1/edit
  def edit
  end

  # POST /froms
  # POST /froms.json
  def create
    @from = From.new(from_params)

    respond_to do |format|
      if @from.save
        format.html { redirect_to @from, notice: 'From was successfully created.' }
        format.json { render :show, status: :created, location: @from }
      else
        format.html { render :new }
        format.json { render json: @from.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /froms/1
  # PATCH/PUT /froms/1.json
  def update
    respond_to do |format|
      if @from.update(from_params)
        format.html { redirect_to @from, notice: 'From was successfully updated.' }
        format.json { render :show, status: :ok, location: @from }
      else
        format.html { render :edit }
        format.json { render json: @from.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /froms/1
  # DELETE /froms/1.json
  def destroy
    @from.destroy
    respond_to do |format|
      format.html { redirect_to froms_url, notice: 'From was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_from
      @from = From.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def from_params
      params.require(:from).permit(:name)
    end
end
