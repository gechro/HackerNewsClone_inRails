class ChangeUserToVoterForPosts < ActiveRecord::Migration
  def change
    rename_column :post_votes, :user_id, :voter_id
  end
end
