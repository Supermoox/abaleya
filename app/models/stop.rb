class Stop < ApplicationRecord
  belongs_to :city
  belongs_to :journey
end
