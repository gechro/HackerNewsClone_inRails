class CommentVote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :voter, class_name: 'User'

  validates_uniqueness_of :user_id, scope => [:comment_id]
end
