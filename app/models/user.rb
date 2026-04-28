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
	before_create :set_user_to_active, :set_loans_count_to_zero
	before_save :downcase_email, :normalize_name
	after_commit :notify_success

	# SCOPES (RAILS CONSOLE)
	# defines a scope (a reusable model query) ---> "user.active_members" instead of "User.where(active: true, role: :member)"
	scope :active_members, -> { where(active: true, role: :member) }


	def normalize_name
		self.name = name.capitalize
	end

	def downcase_email
		self.email = email.downcase
	end

	def notify_success
		Rails.logger.info("user has been successfully [...]")
	end

	def set_user_to_active
		self.active = true
	end

	def set_loans_count_to_zero
		self.loans_count = 0
	end
end
