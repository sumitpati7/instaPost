class AddForeignKeyToComment < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
