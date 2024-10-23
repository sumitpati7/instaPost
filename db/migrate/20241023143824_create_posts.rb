class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.text :caption

      t.timestamps
    end
  end
end
