class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validates :title, presence: true
  validate :body_or_url


  private
  def body_or_url
    if !(body.blank? ^ url.blank?)
      flash[:errors] = "You must enter a url or post text."
    end
  end
end
