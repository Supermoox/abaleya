class Bus < ApplicationRecord
  belongs_to :user
  has_many :journeys
  has_many :sits, dependent: :destroy
  accepts_nested_attributes_for :sits, allow_destroy: true, reject_if: :all_blank
end
