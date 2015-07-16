class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.string :url
      t.integer :user_id, null: false
      t.integer :upvotes, default: 1

      t.timestamps null: false
    end
  end
end
