class DropTableFavReviews < ActiveRecord::Migration[5.2]
  def change
  	drop_table :fav_reviews
  end
end
