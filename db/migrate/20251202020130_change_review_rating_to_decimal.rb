class ChangeReviewRatingToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :rating, :decimal, precision: 3, scale: 2
  end
end
