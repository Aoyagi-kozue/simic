class RemovePublisherIdToComics < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comics, :publisher_id, :integer
  end
end
