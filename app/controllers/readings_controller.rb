class ReadingsController < ApplicationController
  before_action :authenticate_user!   # assumes Devise
  before_action :set_book

  def create
    # avoid duplicates
    @reading = current_user.readings.find_or_create_by(book: @book)

    redirect_to @book, notice: "Added to My Reads."
  end

  def destroy
    @reading = current_user.readings.find(params[:id])
    @reading.destroy

    redirect_to @book, notice: "Removed from My Reads."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
