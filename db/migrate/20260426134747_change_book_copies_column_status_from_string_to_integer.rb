class ChangeBookCopiesColumnStatusFromStringToInteger < ActiveRecord::Migration[8.1]
  def change
    change_column :book_copies, :status, :integer
  end
end
