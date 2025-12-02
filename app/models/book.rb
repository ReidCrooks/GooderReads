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
        values = []

        # ratings from the ratings table (e.g. initial rating from Add Book)
        values.concat ratings.pluck(:value)

        # ratings from reviews
        values.concat reviews.pluck(:rating)

        new_avg =
        if values.any?
            values.sum.to_f / values.size
        else
            0.0
        end

        update!(average_rating: new_avg)
    end
end
