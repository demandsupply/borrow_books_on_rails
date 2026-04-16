class HomeController < ApplicationController
  def index
    @users_count = User.count
    @libraries_count = Library.count
    @books_count = Book.count
    @book_copies_count = BookCopy.count
  end
end
