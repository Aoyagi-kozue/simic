class DropTableLabels < ActiveRecord::Migration[5.2]
  def change
  	drop_table :labels
  end
end
