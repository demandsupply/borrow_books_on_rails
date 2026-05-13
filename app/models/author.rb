class Author < ApplicationRecord
  # RELATIONS
  has_many :books

  # VALIDATIONS
  validates(:author_name, {presence: true})

  # CALLBACKS
  after_commit -> {Rails.logger.info("the author has been successfully created!")}
end
