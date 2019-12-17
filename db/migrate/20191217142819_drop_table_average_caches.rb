class DropTableAverageCaches < ActiveRecord::Migration[5.2]
  def change
  	drop_table :average_caches
  end
end
