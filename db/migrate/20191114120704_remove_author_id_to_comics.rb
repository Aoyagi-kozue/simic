class RemoveAuthorIdToComics < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comics, :author_id, :integer
  end
end
