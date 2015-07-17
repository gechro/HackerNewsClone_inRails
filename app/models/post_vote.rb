class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :voter, class_name: 'User'

  validates_uniqueness_of :user_id, scope => [:post_id]
end
