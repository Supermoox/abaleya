class Seat < ApplicationRecord
	belongs_to :journey
	has_many :purchases
end
