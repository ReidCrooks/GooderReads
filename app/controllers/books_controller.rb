class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.find_or_initialize_by(title: book_params[:title], author: book_params[:author])
    if @book.update(book_params)
      redirect_to @book, notice: "Book successfully added or updated!"
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "Book successfully updated!"
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :rating, :review, :genre)
  end
end
