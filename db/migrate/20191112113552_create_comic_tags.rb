class CreateComicTags < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_tags do |t|
      t.integer :comic_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
