class CreateLoans < ActiveRecord::Migration[8.1]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :copy, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :status

      t.timestamps
    end
  end
end
