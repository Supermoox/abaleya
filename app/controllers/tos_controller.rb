class TosController < ApplicationController
  before_action :set_to, only: [:show, :edit, :update, :destroy]



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
