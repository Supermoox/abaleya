class ChargesController < ApplicationController
	before_action :authenticate_user!
	def new
	end

	def create
	  # Amount in cents

	  seat = Seat.find(params[:seat_id])
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken], 
	  )

	 
	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => (seat.journey.price * 100).to_i,
	    :receipt_email => params[:stripeEmail],
	    :description => 'Seat Number: ' + seat.seat_number.to_s ,
	    :statement_descriptor => "ZAMBUS",
	    :currency    => 'usd',  
	  )

	  purchase = Purchase.create(email: params[:stripeEmail], card: params[:stripeToken], 
	  	amount: (seat.journey.price * 100).to_i, description: seat.journey.description, currency: charge.currency,
	  	customer_id: customer.id, seat_id: seat.id, uuid: SecureRandom.uuid)
	  redirect_to purchase

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end

 