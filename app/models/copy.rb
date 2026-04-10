class Copy < ApplicationRecord
  # RELATIONS
  belongs_to :book
  belongs_to :library
  has_many :loans

  enum status: { available: 0, reserved: 1, borrowed: 2, lost: 3}


  # VALIDATIONS
  validates :barcode, presence: true, uniqueness: true

  
  # ACTIVE RECORD CALLBACKS
  # create a callback BEFORE checking validations (before_validation --> validation --> before_save --> save on db --> after_save)
  before_validation :generate_barcode, on: :create


  private

  def generate_barcode
    if self.barcode.nil? || self.barcode == false
      self.barcode = "LIB-#{SecureRandom.hex(4).upcase}"
    end
  end
end
