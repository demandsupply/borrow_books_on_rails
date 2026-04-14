class RenameCopyIdToBookCopyId < ActiveRecord::Migration[8.1]
  def change
    rename_column :loans, :copy_id, :book_copy_id
  end
end
