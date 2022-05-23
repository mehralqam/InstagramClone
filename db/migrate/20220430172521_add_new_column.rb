class AddNewColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :caption, :string,default: '',limit:200,null: false
  end
end
