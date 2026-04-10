class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      # International Stadard Book Number
      t.string :isbn  

      t.timestamps
    end
  end
end
