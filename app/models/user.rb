class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :readings, dependent: :destroy
  has_many :my_books, through: :readings, source: :book   # books in My Reads
  has_many :books, dependent: :destroy                    # books this user created
end
