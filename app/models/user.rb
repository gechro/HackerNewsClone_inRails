class User < ActiveRecord::Base
  has_many :posts
  has_many :comments, foreign_key: :commenter_id

  validates :username, uniqueness: true
  validates :username, presence: true

  has_secure_password
end
