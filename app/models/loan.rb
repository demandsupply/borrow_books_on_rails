class Loan < ApplicationRecord
  # RELATIONS
  belongs_to :user
  belongs_to :book_copy

  enum :status, { active: 0, returned: 1, overdue: 2 }, prefix: true

  # VALIDATIONS
  # a user can have up to three active loans
  validate :limit_user_loans, on: :create


  # ACTIVE RECORD CALLBACKS
  before_create :set_loan_to_active 

  # callback: after a loan is created, mark that copy as "borrowed" and add 1 to the user_loans counter
  after_create :mark_copy_as_borrowed, :increment_user_loans_count

  # callback: after a copy state is updated to "returned", change that copy status to "available"
  after_update :release_copy, if: :saved_change_to_status?

  # callback: after removing a copy, decrement the user_loans counter by one
  after_destroy :decrement_user_loans_count, if: :status_active?

  # PRIVATE METHODS
  private

  def increment_user_loans_count
    puts "#" * 100
    puts "METHOD: increment_user_loans_count"
    user.increment!(:loans_count)
  end

  def decrement_user_loans_count
    puts "#" * 100
    puts "METHOD: decrement_user_loans_count"
    user.decrement!(:loans_count)    
  end

  def limit_user_loans
    puts "#" * 100
    puts "METHOD: limit_user_loans"
    
    if user.active && user.loans_count < 3      
      puts " user allowed to get the loan"
      return
    else
      puts " user not allowed to get the loan"
      errors.add(:user, "maximum amount of loans reached!")
    end
  end

  def set_loan_to_active
    self.status_active! if self.status.nil?
  end

  def mark_copy_as_borrowed
    puts "#" * 100
    puts "METHOD: mark_copy_as_borrowed"
    book_copy.status_borrowed!
  end

  def release_copy
    puts "#" * 100
    puts "METHOD: release_copy"
    if status_returned?
      book_copy.status_available!
      user.decrement!(:loans_count)
      puts "successfully change book_copy status and decremented user loans_count"
    end
  end
end
