class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer :comment_id, null: false
      t.integer :voter_id, null: false
      t.boolean :voted, default: false

      t.timestamps null: false
    end
  end
end
