class AddCoverFileToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :cover_file, :string
  end
end
