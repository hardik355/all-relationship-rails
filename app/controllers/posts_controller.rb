class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.includes(:tags)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def show
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post = @post.update(post_params)
    redirect_to posts_path
  end

  def all_post
    @posts = Post.all
  end

  def create_comment
    post = Post.find_by(id: params[:post_id])
    @comment = post.comments.new(comment_params)
    if @comment.save
      redirect_to all_post_path, notice: 'Comment created.'
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, tag_ids: [])
  end

  def comment_params
    params.require(:comment).permit(:title)
  end 
end
