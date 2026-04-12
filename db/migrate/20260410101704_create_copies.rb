class CreateCopies < ActiveRecord::Migration[8.1]
  def change
    create_table :copies do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.integer :status
      t.string :barcode

      t.timestamps
    end
  end
end
