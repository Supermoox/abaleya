class Purchase < ApplicationRecord
	belongs_to :seat

	def to_param
		uuid
	end
end
