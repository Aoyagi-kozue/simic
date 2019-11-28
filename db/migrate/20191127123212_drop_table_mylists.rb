class DropTableMylists < ActiveRecord::Migration[5.2]
  def change
  	drop_table :mylists
  end
end
