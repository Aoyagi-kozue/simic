class AddStarToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :star, :float
  end
end
