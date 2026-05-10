class DataController < ApplicationController
  
  def index
    @users = User.all
    @libraries = Library.all
    @books =  Book.all
    @book_copies = BookCopy.all
    @loans = Loan.all
  end

end
