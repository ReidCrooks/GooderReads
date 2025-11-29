class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true   # allow anonymous ratings
      t.decimal :value, precision: 3, scale: 2, null: false  # rating value between 0.00 and 5.00

      t.timestamps
    end
  end
end
