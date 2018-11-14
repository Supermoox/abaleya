class FromsController < ApplicationController
  before_action :set_from, only: [:show, :edit, :update, :destroy]





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
