class User < ApplicationRecord
	# RELATIONS
	has_many :loans, dependent: :destroy
	has_many :book_copies, through: :loans

	enum :role, { member: 0, librarian: 1, admin:2 }, prefix: true

	# VALIDATIONS
	validates :name, presence: true
	# validates email checking the email format usisgn a standard and tested regex
	validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

	# CALLBACKS

	# SCOPES (RAILS CONSOLE)
	# defines a scope (a reusable model query) ---> "user.active_members" instead of "User.where(active: true, role: :member)"
	scope :active_members, -> { where(active: true, role: :member) }


	# function which returns true if conditions are met
	def can_borrow_more?
		return false unless active
		
		loans.where(status: :active).count < 3
	end
end
