class AddProfImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prof_image, :text
  end
end
