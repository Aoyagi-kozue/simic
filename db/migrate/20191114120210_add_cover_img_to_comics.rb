class AddCoverImgToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :cover_img, :text
  end
end
