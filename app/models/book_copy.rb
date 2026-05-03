class BookCopy < ApplicationRecord
  # RELATIONS
  belongs_to :book
  belongs_to :library
  has_many :loans

  enum :status, { available: 0, reserved: 1, borrowed: 2, lost: 3}, prefix: true


  # VALIDATIONS
  validates :barcode, presence: true, uniqueness: true

  
  # ACTIVE RECORD CALLBACKS
  # create a callback BEFORE checking validations (before_validation --> validation --> before_save --> save on db --> after_save)
  before_validation :set_status_to_available, :generate_barcode, on: :create

  
  private

  def set_status_to_available
    self.status_available! if self.status.nil?
  end

  def generate_barcode
    if barcode.blank?
      self.barcode = "LIB-#{SecureRandom.hex(4).upcase}"
    end
  end
end
