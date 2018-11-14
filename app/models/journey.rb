class Journey < ApplicationRecord
  belongs_to :from
  belongs_to :to
  belongs_to :user
  has_many :seats, dependent: :destroy
  after_create :add_seats

  #accepts_nested_attributes_for :seats, allow_destroy: true, reject_if: :all_blank
  private
  	def add_seats
  		@num = 1
  		47.times do
  			@seat = self.seats.create!
  			@seat.seat_number = @num 
  			@seat.save
  			@num = @num + 1
  		end
  	end

end
