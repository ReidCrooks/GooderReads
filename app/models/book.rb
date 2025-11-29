class Book < ApplicationRecord
    has_one_attached :cover_image
    validates :title, presence: true
    validates :author, presence: true
    validates :title, uniqueness: { scope: :author, message: "This title already exists" }
    # associates books with book genre join table
    has_many :book_genres, dependent: :destroy
    has_many :genres, through: :book_genres
    belongs_to :user
end
