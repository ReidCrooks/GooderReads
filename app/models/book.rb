class Book < ApplicationRecord
    has_one_attached :cover_image
    validates :title, presence: true
    validates :author, presence: true
    validates :title, uniqueness: { scope: :author, message: "This title already exists" }
    # associates books with book genre join table
    has_many :book_genres, dependent: :destroy
    has_many :genres, through: :book_genres
    has_one_attached :cover_image
    belongs_to :user # , optional: true

    has_many :ratings, dependent: :destroy
    has_many :reviews, dependent: :destroy

    # associate books with readings join table
    has_many :readings, dependent: :destroy
    has_many :readers, through: :readings, source: :user

    def recalculate_average_rating!
        new_avg = ratings.average(:value) || 0.0 # calculate average or default to 0.0
        update!(average_rating: new_avg)
    end
end
