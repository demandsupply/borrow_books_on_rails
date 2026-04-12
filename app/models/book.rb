class Book < ApplicationRecord
    # RELATIONS
    # if the book is destroyed, all the associated copies are destroyed
    has_many :book_copies, dependent: :destroy
    # a book has many loans through the intermediate "model" copies
    has_many :loans, through: :book_copies

    # VALIDATIONS
    # a book must contains the "title" and "author" fields (symbols), with an hash of options {presence: true}
    validates(:title, :author, {presence: true})
    # a book must contains the "isbn" field, which is unique and must be 13 chars long 
    validates :isbn, presence: true, uniqueness: true, length: { is: 13 }

    # ACTIVE RECORD CALLBACKS
    after_commit -> { Rails.logger.info("the book has successfully been created!") }
end
