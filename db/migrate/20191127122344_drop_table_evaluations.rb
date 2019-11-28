class DropTableEvaluations < ActiveRecord::Migration[5.2]
  def change
  	drop_table :evaluations
  end
end
