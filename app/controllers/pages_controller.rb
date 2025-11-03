class PagesController < ApplicationController
  def home
    @books = Book.all
    @dev_book = Book.first
  end
end
