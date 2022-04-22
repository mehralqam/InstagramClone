class Story < ActiveRecord::Migration[5.2]
  def change
    create_table :storys, &:timestamps
    add_reference :storys, :user, index: true, foreign_key: true
  end
end
