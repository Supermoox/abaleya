ActiveAdmin.register Journey do
  permit_params :price, :departure, :arrival, :total_seats, :description, :from_id, :to_id, :bus_id, seats_attributes: [:id, :_destroy, :seat_number, :journey_id]
end
