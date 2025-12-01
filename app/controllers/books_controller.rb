class BooksController < ApplicationController
  before_action :authenticate_user! # Ensure user is authenticated to view their books

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
    @book = Book.new(book_params)

    initial_rating_value = params[:book][:initial_rating].presence

    if @book.save
      if initial_rating_value
        @book.ratings.create!(value: initial_rating_value)
        @book.recalculate_average_rating!
      end

      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Discover action to show all books
  def discover
    @query = params[:query]

    if @query.present?
      # SQLite: LIKE is case-insensitive by default
      @books = Book.where("title LIKE ?", "%#{@query}%").order(created_at: :desc)
    else
      @books = Book.all.order(created_at: :desc)
    end
  end


  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :review,
      :cover_image,
      :description,
      genre_ids: [] # allow multiple genre id's
    )
  end
end
