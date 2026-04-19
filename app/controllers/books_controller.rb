class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

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
    @book
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "Book successfully updated"
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
  end


  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description)
  end
end
