class AddUserForeignKeyToPost < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :posts, :users, column: :user_id
  end
end
