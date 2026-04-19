class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.all.order(title: :asc)
  end

  def show
    @book_copies = @book.book_copies

    # lately, consider to include :libraries in you want to show the library name for each book (eager loading, avoid N + 1 problem)  
    # @book_copies = @book.book_copies.includes(:library)
  end

  def new
  end

  def edit
  end

  def destroy
  end


  private

  def set_book
    @book = Book.find(params[:id])
  end
end
