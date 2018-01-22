class Sit < ApplicationRecord
  belongs_to :bus
  has_many :purchases
end
