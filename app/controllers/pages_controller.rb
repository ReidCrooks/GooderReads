class PagesController < ApplicationController

  layout "application"
  
  def home
    # Featured "dev" book: prefer one with a cover image, else fall back to first book
    @dev_book = Book.joins(:cover_image_attachment)
                    .order(created_at: :desc)
                    .first || Book.first


    @books = Book.all.order(created_at: :desc)

    # Pick 4 random genres that actually have books
    genres = Genre.joins(:books).distinct.sample(4)

    @recommended_books = genres.map do |genre|
      # select ONE random book from this genre
      book = genre.books.sample
      [ genre, book ]
    end
  end
end
