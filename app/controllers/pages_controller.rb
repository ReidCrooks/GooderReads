class PagesController < ApplicationController
  def home
    @dev_book = Book.first
    
    all_books = Book.all

    books_by_genre = all_books.group_by(&:genre)

    random_genres = books_by_genre.keys.sample(5)

    @recommended_books = random_genres.map do |genre|
      [genre, books_by_genre[genre].sample(3)]
    end.to_h
  end
end
