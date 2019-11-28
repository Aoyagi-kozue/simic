class RemoveGenreIdToComics < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comics, :genre_id, :integer
  end
end
