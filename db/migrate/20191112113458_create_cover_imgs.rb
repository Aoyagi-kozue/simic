class CreateCoverImgs < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_imgs do |t|
      t.integer :comic_id
      t.text :cover_img

      t.timestamps
    end
  end
end
