class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :body, presence: true

  validates :rating,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0.25,
      less_than_or_equal_to: 5
    }
  after_commit :recalculate_book_rating, on: [:create, :update, :destroy]

  private

  def recalculate_book_rating
    book.recalculate_average_rating!
  end
end
