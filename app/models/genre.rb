class Genre < ApplicationRecord
  # a genre can describe more books
  has_and_belongs_to_many :books
end
