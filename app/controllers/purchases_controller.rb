class PurchasesController < ApplicationController
	#before_action :authenticate_user!
	#before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy, :index]
	#before_action :restrict_user, only: [ :edit, :create, :update, :destroy, :index]

	def index
		#@msg = false
		@purchases = Purchase.all.where(user_id: params[:user_id])
		desired_id = @purchases.last.user_id
		redirect_to root_path, notice: "You do not have access permission" if (current_user.id != desired_id)
		
		# if !@purchases.nil? 
		# 	desired_id = @purchases.last.user_id
		# 	redirect_to root_path, notice: "You do not have access permission" if (current_user.id != desired_id)
		# else
		# 	@msg = true
		# end
	end

	def show
		@purchase = Purchase.find_by_uuid(params[:id])
		@seat = Seat.find(@purchase.seat_id)	
	end

	def purchase_params
		params.require(:purchase).permit(:user_id)
	end


	def authenticate_user
		redirect_to login_path, notice: "You must login first" if !current_user # if current user doesn't exist it will redirect to login path with a notice
	end


	def restrict_user 
		redirect_to root_path, notice: "You do not have access permission" if (current_user.id == params[:user_id])
	end
		

end