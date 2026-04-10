class Loan < ApplicationRecord
  # RELATIONS
  belongs_to :user
  belongs_to :copy

  enum status: { active: 0, returned: 1, overdue: 2 }

  # VALIDATIONS
end
