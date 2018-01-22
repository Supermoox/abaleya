class Journey < ApplicationRecord
  belongs_to :from
  belongs_to :to
  belongs_to :bus
  has_many :seats, dependent: :destroy

  accepts_nested_attributes_for :seats, allow_destroy: true, reject_if: :all_blank

end
