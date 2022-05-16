class AddValidationsToUsers < ActiveRecord::Migration[5.2]
def change
change_table :users do |t|
  t.rename :name, :user_name
end
end
end
