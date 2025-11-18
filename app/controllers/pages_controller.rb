class PagesController < ApplicationController
  def home
    # Featured "dev" book: prefer one with a cover image, else fall back to first book
    @dev_book = Book.joins(:cover_image_attachment)
                    .order(created_at: :desc)
                    .first || Book.first

    # Pick up to 5 random genres that actually have books
    genres_with_books = Genre.joins(:books).distinct
    random_genres = genres_with_books.sample(5)

    # Build a hash: { Genre => [books...] }
    @recommended_books = random_genres.index_with do |genre|
      genre.books.distinct.sample(3)   # up to 3 books per genre
    end
  end
end
