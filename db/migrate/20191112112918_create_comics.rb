class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.integer :author_id
      t.integer :publisher_id
      t.integer :label_id
      t.integer :genre_id
      t.string :title

      t.timestamps
    end
  end
end
