class ChangeBookRatingToAverageRating < ActiveRecord::Migration[7.1]
  def change
    # rename the column
    rename_column :books, :rating, :average_rating

    # change type to decimal
    change_column :books, :average_rating, :decimal, precision: 3, scale: 2, default: 0.0
  end
end
