class DropTableOverallAverages < ActiveRecord::Migration[5.2]
  def change
  	drop_table :overall_averages
  end
end
