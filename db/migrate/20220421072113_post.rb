# frozen_string_literal: true

class Post < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, index: true, foreign_key: true, null: false
  end
end
