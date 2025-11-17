class Book < ApplicationRecord
    has_one_attached :cover_image
    validates :title, presence: true
    validates :author, presence: true
    validates :title, uniqueness: { scope: :author, message: "This title already exists" }

end
