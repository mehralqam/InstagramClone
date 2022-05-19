# frozen_string_literal: true

class AddSearchableColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    def up
      execute <<-SQL
        ALTER TABLE users
        ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
          setweight(to_tsvector('english', coalesce(user_name, ''))
        ) STORED;
      SQL
    end

    def down
      remove_column :users, :searchable
    end
  end
end
