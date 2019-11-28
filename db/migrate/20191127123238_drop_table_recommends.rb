class DropTableRecommends < ActiveRecord::Migration[5.2]
  def change
  	drop_table :recommends
  end
end
