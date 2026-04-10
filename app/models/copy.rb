class Copy < ApplicationRecord
  # RELATIONS
  belongs_to :book
  belongs_to :library
  has_many :loans

  enum status: { available: 0, reserved: 1, borrowed: 2, lost: 3}


  # VALIDATIONS
  validates :barcode, presence: true, uniqueness: true
end
