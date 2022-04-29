class Comment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, &:timestamps
    add_column :comments, :description, :string
    add_reference :comments, :user, index: true, foreign_key: true
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
