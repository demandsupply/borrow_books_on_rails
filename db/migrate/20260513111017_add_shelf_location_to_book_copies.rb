class AddShelfLocationToBookCopies < ActiveRecord::Migration[8.1]
  def change
    add_column :book_copies, :shelf_location, :string
  end
end
