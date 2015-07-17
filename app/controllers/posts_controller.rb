class PostsController < ApplicationController
  before_action :require_login, only: [:new,:edit,:destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = @current_user
    if post.save
      redirect_to post_path(post)
    else
      flash[:errors] = post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def newest
    @posts = Post.all.order("created_at desc")
    render :'posts/newest'
  end


  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update_attributes(post_params)
    votes = PostVote.where(post_id: post.id, voted: true).count
    post.update_attributes(upvotes: votes)
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :body, :upvotes)
  end
end
