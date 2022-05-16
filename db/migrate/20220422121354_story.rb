class Story < ActiveRecord::Migration[5.2]
  def change
    create_table :stories, &:timestamps
    add_reference :stories, :user, index: true, foreign_key: true ,null: false
  end
end
