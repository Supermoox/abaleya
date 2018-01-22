class Search < ApplicationRecord

	def find_journeys

			journeys = Journey.all
			journeys = journeys.where(from_id: from_id) if from_id.present?
			journeys = journeys.where(to_id: stop_id) if stop_id.present?
			journeys = journeys.where("departure BETWEEN ? AND  ?", departure.beginning_of_day, departure.end_of_day) if departure.present?
	
		return journeys
	end
end
