class Loan < ApplicationRecord
  # RELATIONS
  belongs_to :user
  belongs_to :book_copy

  enum :status, { active: 0, returned: 1, overdue: 2 }, prefix: true

  # VALIDATIONS
  # a user can have up to three active loans
  validate :limit_user_loans, on: :create


  # ACTIVE RECORD CALLBACKS
  # callback: after a loan is created, mark that copy as "borrowed" and add 1 to the user_loans counter
  after_create :mark_copy_as_borrowed, :increment_user_loans_count

  # callback: after a copy state is updated to "returned", change that copy status to "available"
  after_update :release_copy, if: :saved_change_to_status?

  # callback: after removing a copy, decrement the user_loans counter by one
  after_destroy :decrement_user_loans_count

  # PRIVATE METHODS
  private

  def increment_user_loans_count
    puts "#" * 100
    puts "METHOD: increment_user_loans_count"
    user.increment!(:loans_count)
  end

  def decrement_user_loans_count
    user.decrement!(:loans_count)
  end

  def limit_user_loans
    if user.can_borrow_more?
      return
    else
      errors.add(:user, "maximum amount of loans reached!")
    end
  end

  def mark_copy_as_borrowed
    puts "#" * 100
    puts "METHOD: mark_copy_as_borrowed"
    book_copy.status_borrowed!
  end

  def release_copy
    book_copy.status_available! if status == "returned"
  end
end
