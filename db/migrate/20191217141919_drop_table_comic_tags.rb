class DropTableComicTags < ActiveRecord::Migration[5.2]
  def change
  	drop_table :comic_tags
  end
end
