class DropTableCoverImgs < ActiveRecord::Migration[5.2]
  def change
  	drop_table :cover_imgs
  end
end
