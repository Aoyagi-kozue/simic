class RemoveLabelIdToComics < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comics, :label_id, :integer
  end
end
