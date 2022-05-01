class AddNewColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :likes, :int, :default=>0
  end
end
