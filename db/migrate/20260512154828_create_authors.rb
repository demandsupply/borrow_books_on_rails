class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :author_name
      t.text :biography
      t.string :nationality
      t.date :birth_date
      t.date :death_date

      t.timestamps
    end
  end
end
