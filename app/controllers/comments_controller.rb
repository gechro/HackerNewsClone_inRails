class CommentsController < ApplicationController
  before_action :require_login, only: [:new,:create, :edit, :destroy]
  def index
    @post = Post.find_by(params[:id])
    @comments = @post.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.commenter = @current_user
    post = Post.find_by(id: params[:post_id])
    comment.post = post
    if comment.save
      redirect_to post_path(post)
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to post_path(post)
    end
  end

  def newest
   @comments = Comment.all.order("created_at desc")
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :upvotes)
  end

end
