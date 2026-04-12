class RenameCopiesToBookCopies < ActiveRecord::Migration[8.1]
  def change
    rename_table :copies, :book_copies
  end
end
