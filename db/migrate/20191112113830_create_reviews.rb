class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :comic_id
      t.text :review_text
      t.string :review_title
      t.integer :netabare

      t.timestamps
    end
  end
end
