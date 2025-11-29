class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user, optional: true

  validates :value,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 5 }
end
