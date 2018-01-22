class SearchesController < ApplicationController

	def new
		@search = Search.new
	end

	def create 
		@search = Search.create!(search_params)

		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@searches = @search.find_journeys.order("departure")
	end


	private

	  def search_params
	    params.require(:search).permit(:from_id, :stop_id, :departure)
	  end
end
