class MyJourneysController < ApplicationController
  before_action :authenticate_user!

  def index
  	@journeys = Journey.where(user_id: current_user.id).order("departure DESC").paginate(page: params[:page], per_page: 10)
  end  
end
