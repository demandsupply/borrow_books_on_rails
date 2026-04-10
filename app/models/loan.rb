class Loan < ApplicationRecord
  # RELATIONS
  belongs_to :user
  belongs_to :copy

  enum status: { active: 0, returned: 1, overdue: 2 }

  # VALIDATIONS
  # a user can have up to three active loans
  validate :limit_user_loans, on: :create


  # ACTIVE RECORD CALLBACKS
  # calback: after a loan is created, mark that copy as "borrowed"
  after_create :mark_copy_as_borrowed

  # callback: after a copy state is updated to "returned", change that copy status to "available"
  after_update :release_copy, if: :saved_change_to_returned?


  # PRIVATE METHODS
  private

  def limit_user_loans
    if user.active.loans.count > 3
      errors.add(:user, "maximum amount of loans reached!")
    end
  end

  def mark_copy_as_borrowed
    copy.borrowed!
  end

  def release_copy
    copy.available! if status == "returned"
  end
end
