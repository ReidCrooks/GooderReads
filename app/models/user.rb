class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :readings, dependent: :destroy
  has_many :readers, through: :readings, source: :user
  has_many :my_books, through: :readings, source: :book
  has_many :reviews, dependent: :destroy
end
