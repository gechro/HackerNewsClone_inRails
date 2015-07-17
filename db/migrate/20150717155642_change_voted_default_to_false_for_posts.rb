class ChangeVotedDefaultToFalseForPosts < ActiveRecord::Migration
  def change
    change_column_default :post_votes, :voted, false
  end
end
