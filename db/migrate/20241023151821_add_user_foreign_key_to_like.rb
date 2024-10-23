class AddUserForeignKeyToLike < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :likes, :users, column: :user_id
  end
end
