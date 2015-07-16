class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :post_id, null: false
      t.integer :commenter_id, null:false
      t.integer :upvotes, default: 1

      t.timestamps null: false
    end
  end
end
