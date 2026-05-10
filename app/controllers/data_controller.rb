class DataController < ApplicationController
  
  def index
    # collection of all the users
    @users = User.all
    
    # collection of all the libaries
    @libraries = Library.all
    
    # collection of all the books
    @q = Book.ransack(params[:q])
    @books =  @q.result(distinct: true)
    
    # collection of all the book_copies
    @book_copies = BookCopy.all

    # collection of all the loans
    @loans = Loan.all
  end

end
