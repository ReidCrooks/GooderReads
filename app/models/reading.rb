class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # prevent duplicates
  validates :user_id, uniqueness: { scope: :book_id }
end
