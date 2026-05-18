class CreateJoinTableBooksGenres < ActiveRecord::Migration[8.1]
  def change
    create_join_table :books, :genres do |t|

      # create idexes to improve performance - speed up data retrieval 
      t.index [:book_id, :genre_id], unique: true
      t.index [:genre_id, :book_id]
    end
  end
end
