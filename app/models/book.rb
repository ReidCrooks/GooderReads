class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :title, uniqueness: {scope: :author, message: "This title already exists"}

end
